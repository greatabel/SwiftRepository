import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KVNProgress.setConfiguration(KVNProgressConfiguration.default())


    }

    override func viewDidAppear(_ animated: Bool) {
        
        KVNProgress.show(withStatus: "test")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

