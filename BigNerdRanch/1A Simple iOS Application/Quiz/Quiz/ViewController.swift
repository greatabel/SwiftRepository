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

    var currentQuestionIndex: Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex++
        print("showNextQuestion currentQuestionIndex = ", currentQuestionIndex)
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "?"
        


    }

    @IBAction func showAnswer(sender: AnyObject) {
        print("showAnswer currentQuestionIndex = ", currentQuestionIndex)

        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
}

