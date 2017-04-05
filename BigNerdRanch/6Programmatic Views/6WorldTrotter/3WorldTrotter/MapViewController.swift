import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView!

    override func loadView() {
        mapView = MKMapView()
        view = mapView

        let segmentedControl =
            UISegmentedControl(items: ["Standard", "Hybrid",
                                       "Satellite"])
        segmentedControl.backgroundColor =
            UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0

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
            topConstraint.isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            let leadingConstraint =
                segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            leadingConstraint.isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            let trailingConstraint =
                segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            trailingConstraint.isActive = true
        } else {
            // Fallback on earlier versions
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view")
    }

}