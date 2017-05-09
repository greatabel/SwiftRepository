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

        // literal expressions
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
//        print("sender:\(sender)")
//        print("Is control on? \(sender.isOn)")
        badMethod()

    }

//    @IBAction func swtichToggled(_ sender: UISwitch){
//        print("swtichToggled")
//    }

    func badMethod() {
        let array = NSMutableArray()
        for i in 0..<5 {
            array.insert(i, at: i)
        }
        // select Log Message. In the Text field, enter Pass number %H (%H is the breakpoint hit count,
        print("# array= \(array)")
        // Go one step too far emptying the array (notice the range change):
        for j in 0...5 {
            array.remove(at: j)
        }
        print("array= \(array)")
        // 故意留的bug ->: print(array[3])
//        print(array[3])
    }


}

