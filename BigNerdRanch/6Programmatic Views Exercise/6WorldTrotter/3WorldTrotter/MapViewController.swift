import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {

    var mapView: MKMapView!

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
        print("MapViewController loaded its view")
    }

}
