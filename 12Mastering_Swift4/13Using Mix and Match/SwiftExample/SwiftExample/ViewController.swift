import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageBox: UITextView?
    @IBOutlet weak var nameField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func messagePressed(_ sender: UIButton) {
        let message = MessageBuilder()
        messageBox!.text = message.getPersonalizedMessage(forName: nameField!.text);
    }

}

