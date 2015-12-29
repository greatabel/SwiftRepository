import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var answerLabel: UILabel!

    let questions: [String] = [
    "What's PI ?",
    "What's capital of China?",
    "Who invented plane?"
    ]

    let answers: [String] = [
    "3.1415926",
    "BeiJing",
    "Wright brothers"
    ]

    var currentQuestionIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showNextQuestion(sender: AnyObject) {

    }

    @IBAction func showAnswer(sender: AnyObject) {

    }
    
}

