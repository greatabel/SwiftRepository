import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    private var gestureStartPoint: CGPoint!



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let vertical = UISwipeGestureRecognizer(target: self,
                action: #selector(ViewController.reportVerticalSwipe(_:)))
        vertical.direction = [.up, .down]
        view.addGestureRecognizer(vertical)

        let horizontal = UISwipeGestureRecognizer(target: self,
               action: #selector(ViewController.reportHorizontalSwipe(_:)))
        horizontal.direction = [.left, .right]
        view.addGestureRecognizer(horizontal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




    func reportHorizontalSwipe(_ recognizer:UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            self.label.text = ""
        })
    }

    func reportVerticalSwipe(_ recognizer:UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            self.label.text = ""
        })
    }


}

