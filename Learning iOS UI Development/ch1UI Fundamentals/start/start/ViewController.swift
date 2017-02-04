import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewContainer: UIView!

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


    @IBAction func deepHierarchy() {
        print("deepHierarchy")
    }
}

