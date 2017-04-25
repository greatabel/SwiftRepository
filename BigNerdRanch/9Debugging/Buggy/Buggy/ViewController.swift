import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton){
//        print("buttonTapped")
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
//        print("sender:\(sender)")
//        print("Is control on? \(sender.isOn)")

    }

//    @IBAction func swtichToggled(_ sender: UISwitch){
//        print("swtichToggled")
//    }


}

