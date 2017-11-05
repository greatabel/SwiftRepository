import Foundation
import CoreLocation

struct Location {
    let lat: Double
    let lon: Double
}

class LocationDatastore: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()

    typealias LocationClosure = (Location) -> Void
    private let onLocationFound: LocationClosure

    init(closure: @escaping LocationClosure){
        onLocationFound = closure
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        startUpdating()
    }


    private func startUpdating() {
        locationManager.startUpdatingLocation()
    }

    private func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        DispatchQueue.main.async(){
            self.onLocationFound(Location(lat: 37.3175, lon: 122.0419))
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate

        DispatchQueue.main.async(){
            self.onLocationFound(Location(lat: coord.latitude, lon: coord.longitude))
//            self.onLocationFound(Location(lat: 31.2304, lon: 121.4737))
        }

        stopUpdating()
    }

    private func locationManager(manager: CLLocationManager,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            NSLog("Denied access: Restricted Access to location")
        case .denied:
            NSLog("Denied access: User denied access to location")
        case .notDetermined:
            NSLog("Denied access: Status not determined")
        default:
            NSLog("Allowed to location Access")
            startUpdating()
        }
    }
}

