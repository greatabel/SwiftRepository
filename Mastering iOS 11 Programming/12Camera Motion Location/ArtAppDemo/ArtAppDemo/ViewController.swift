import UIKit
import AVFoundation
import CoreMotion
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var videoView: UIView!


    @IBOutlet var hConstraint: NSLayoutConstraint!
    @IBOutlet var vConstraint: NSLayoutConstraint!

    @IBOutlet var nearbyArtLabel: UILabel!

    let captureSession = AVCaptureSession()

    let locationManager = CLLocationManager()

    var motionManager: CMMotionManager!
    var startRoll: Int?
    var startPitch: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupMotionUpdates()
        setupCameraView()
        setupLocationUpdates()
    }


    func setupLocationUpdates() {
        locationManager.delegate = self

        let authStatus = CLLocationManager.authorizationStatus()
        switch authStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            startLocationTracking()
        default:
            break
        }
    }

    func setupMotionUpdates() {
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { data, _ in
            guard let motionData = data
                else { return }

            let roll = Int(motionData.attitude.roll * 180 / .pi)
            let pitch = Int(motionData.attitude.pitch * 180 / .pi)

            if self.startRoll == nil { self.startRoll = roll }
            if self.startPitch == nil { self.startPitch = pitch }

            guard let startRoll = self.startRoll,
                let startPitch = self.startPitch
                else { return }

            self.vConstraint.constant = CGFloat(pitch - startPitch)
            self.hConstraint.constant = -CGFloat(roll - startRoll)
        }
    }
    

    func setupCameraView() {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { authorized in
                if authorized {
                    DispatchQueue.main.async { [weak self] in
                        self?.displayCamera()
                    }
                } else {
                    print("Did not authorize")
                }
            }
        case .authorized:
            displayCamera()
        case .denied, .restricted:
            print("No access granted")
        }
    }



    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            startLocationTracking()
        }
    }

    func startLocationTracking() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last
            else { return }

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, completionHandler: { [weak self] placemarks, _ in
            guard let placemark = placemarks?.first,
                let city = placemark.locality
                else { return }

            self?.nearbyArtLabel.text = "Explore 17 pieces of art in \(city)"
        })

        manager.stopUpdatingLocation()
    }

    func displayCamera() {
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)
        let availableCameras = discoverySession.devices

        guard let backCamera = availableCameras.first,
            let input = try? AVCaptureDeviceInput(device: backCamera)
            else { return }

        if captureSession.canAddInput(input) {
            captureSession.addInput(input)
        }

        let preview = AVCaptureVideoPreviewLayer(session: captureSession)

        preview.frame = view.bounds
        videoView.layer.addSublayer(preview)

        captureSession.startRunning()
    }

}

