import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let blockOperation = BlockOperationTest()
        blockOperation.example()
        
     //   let operationWithBlock = OperationWithBlockTest()
     //   operationWithBlock.example()
        
     //   let myOperationTest = MyOperationTest()
     //   myOperationTest.example()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

