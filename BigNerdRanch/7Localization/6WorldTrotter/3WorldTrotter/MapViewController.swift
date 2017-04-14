import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {

    var mapView: MKMapView!

    // https://makeapppie.com/tag/mkannotationview/ 1.可以添加范围 没做
    // http://rshankar.com/how-to-add-mapview-annotation-and-draw-polyline-in-swift/ 2. 添加轨迹

    // 为添加小红旗地标
    var annotations = [MKPointAnnotation]()

    func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }

    override func loadView() {
        mapView = MKMapView()
        view = mapView

        let segmentedControl =
            UISegmentedControl(items: ["Standard", "Hybrid",
                                       "Satellite"])
        segmentedControl.backgroundColor =
            UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0

        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:))
            , for: .valueChanged)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)

        if #available(iOS 9.0, *) {
//            let topConstraint =
//                segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)

            let topConstraint =
                segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,
                                                      constant: 8)
//            let topConstraint =
//                segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor)

            let margins = view.layoutMarginsGuide

            let leadingConstraint =
                segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
            let trailingConstraint =
                segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
//            let leadingConstraint =
//                segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//
//
//            let trailingConstraint =
//                segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)

            topConstraint.isActive = true
            leadingConstraint.isActive = true
            trailingConstraint.isActive = true


        } else {
            // Fallback on earlier versions
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // http://www.techotopia.com/index.php/Working_with_Maps_on_iOS_8_with_Swift,_MapKit_and_the_MKMapView_Class
        mapView.showsUserLocation = true
        mapView.delegate = self
        add_locations()
        mapView.addAnnotations(annotations)
        centerMapOnLocation(location: annotations[0], regionRadius: 1000.0)

        print("MapViewController loaded its view")
    }

    func mapView(_ mapView: MKMapView, didUpdate
        userLocation: MKUserLocation) {
            mapView.centerCoordinate = userLocation.location!.coordinate
        // http://stackoverflow.com/questions/11622579/how-to-pinch-out-in-ios-simulator-when-map-view-is-only-a-portion-of-the-screen
            print("here:\(userLocation.location!.coordinate)")
    }

    func add_locations() {
        // http://mhorga.org/2015/08/01/introduction-to-mapkit.html

        let locations = [
            ["name" : "Wu han, Luminagic",
             "latitude" : 30.511128249323583,
             "longitude" : 114.39239169633259,
             "mediaURL" : "http://www.douban.com"],
            ["name" : "Wu han, Other place",
             "latitude" : 30.512118249123583,
             "longitude" : 114.39832769633259,
             "mediaURL" : "http://www.baidu.com"]
        ]


        for dictionary in locations {
            let latitude = CLLocationDegrees(dictionary["latitude"] as! Double)
            let longitude = CLLocationDegrees(dictionary["longitude"] as! Double)
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let name = dictionary["name"] as! String
            let mediaURL = dictionary["mediaURL"] as! String
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(name)"
            annotation.subtitle = mediaURL
            annotations.append(annotation)
        }


    }

    func centerMapOnLocation(location: MKPointAnnotation, regionRadius: Double) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // http://stackoverflow.com/questions/41864720/swift-mapview-not-adding-annotation-to-map
        if annotation is MKUserLocation { return nil }   // let the OS show user locations itself

        let reuseIdentifier = "pin"
        var pin = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKPinAnnotationView
        if pin == nil {
            pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            pin!.pinTintColor = .red
            pin!.canShowCallout = true
            pin!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        } else {
            pin!.annotation = annotation
        }
        return pin
    }

    func mapView(_ mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == annotationView.rightCalloutAccessoryView {
            let app = UIApplication.shared
            app.openURL(NSURL(string: (annotationView.annotation!.subtitle!)!)! as URL)
        }
    }

}
