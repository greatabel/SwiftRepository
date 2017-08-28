import UIKit

class ViewController: UIViewController {

    @IBOutlet var singleLabel:UILabel!
    @IBOutlet var doubleLabel:UILabel!
    @IBOutlet var tripleLabel:UILabel!
    @IBOutlet var quadrupleLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func singleTap() {
        showText("Single Tap Detected", inLabel: singleLabel)
    }

    func doubleTap() {
        showText("Double Tap Detected", inLabel: doubleLabel)
    }

    func tripleTap() {
        showText("Triple Tap Detected", inLabel: tripleLabel)
    }

    func quadrupleTap() {
        showText("Quadruple Tap Detected", inLabel: quadrupleLabel)
    }
    
    private func showText(_ text: String, inLabel label: UILabel) {
        label.text = text
        DispatchQueue.main.asyncAfter(deadline:
            DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            label.text = ""
        })
    }


}

