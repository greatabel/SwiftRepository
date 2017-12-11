import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        redView?.backgroundColor = UIColor.red
        redView?.center = view.center
        view.addSubview(redView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

