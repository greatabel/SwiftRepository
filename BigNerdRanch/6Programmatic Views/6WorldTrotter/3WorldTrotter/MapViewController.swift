import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView!

    override func loadView() {
        mapView = MKMapView()
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view")
    }

}
