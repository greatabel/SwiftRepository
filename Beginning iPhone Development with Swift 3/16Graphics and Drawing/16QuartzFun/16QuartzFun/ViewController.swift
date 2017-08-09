import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeColor(_ sender: UISegmentedControl) {
        
    }

    @IBAction func changeShape(_ sender: UISegmentedControl) {
    }
}

