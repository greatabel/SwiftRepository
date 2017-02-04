import UIKit

class ViewController: UIViewController {



    @IBOutlet var viewContainer: UIView!
    var isCenterAligned = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(ViewController.tap(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    func tap(_ gesture: UITapGestureRecognizer) {
        print("in tap")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clear() {
        print("clear")
    }

    @IBAction func updateAlignmentPref(_ sender: UISegmentedControl) {
           isCenterAligned = sender.selectedSegmentIndex == 1
            print("isCenterAligned: \(isCenterAligned)")

    }

    @IBAction func deepHierarchy() {
        print("deepHierarchy")
        clear()
        addInnerView(viewContainer)
    }

    // Add a UIView child to the received view and call itself on
    // the child view just added
    func addInnerView(_ parentView:UIView){

        // Create and attach the new view
        var viewSize = parentView.bounds.size
        viewSize.width -= 20
        viewSize.height -= 20
        let viewFrame = CGRect(origin: CGPoint(x: 10, y: 10), size:viewSize)
        let childView = UIView(frame: viewFrame)
        parentView.addSubview(childView)

        // Draw borders
        childView.layer.borderColor = UIColor.red.cgColor
        childView.layer.borderWidth = 1

        // Base case depending on width
        if viewSize.width > 40 {
            addInnerView(childView)
        }
    }

}

