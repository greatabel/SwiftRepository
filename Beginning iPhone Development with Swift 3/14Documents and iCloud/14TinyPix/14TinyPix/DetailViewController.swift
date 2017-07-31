import UIKit

class DetailViewController: UIViewController {


    @IBOutlet var pixView: TinyPixView!



    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = detailItem {
////            if let label = detailDescriptionLabel {
////                label.text = detail.timestamp!.description
////            }
//        }
        if detailItem != nil && isViewLoaded {
            pixView.document = detailItem as! TinyPixDocument
            pixView.setNeedsDisplay()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

