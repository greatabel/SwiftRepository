import UIKit

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doButton1(_ sender: UIButton) {
        common(sender)
    }
    
    @IBAction func doButton2(_ sender: UIButton) {
        common(sender)
    }

    func common(_ sender: UIButton) {
        let v = sender
        let screen = UIScreen.main.fixedCoordinateSpace
        let r = v.superview!.convert(v.frame, to: screen)
        print(r)
        print(v.frame)
        do {
            let r = v.superview!.convert(v.frame, to: UIScreen.main.coordinateSpace)
            print(r)
            print(v.frame)
        }
    }
}

