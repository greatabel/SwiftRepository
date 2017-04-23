import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet var currentQuestionLabel: UILabel!

    @IBOutlet var nextQuestionLabel: UILabel!

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
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showNextQuestion(_ sender: AnyObject) {
        currentQuestionIndex += 1
        print("showNextQuestion currentQuestionIndex = ", currentQuestionIndex)
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
//        questionLabel.text = question
        nextQuestionLabel.text = question
        answerLabel.text = "?"

        animateLabelTransitions()
        


    }

    @IBAction func showAnswer(_ sender: AnyObject) {
        print("showAnswer currentQuestionIndex = ", currentQuestionIndex)

        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

    func animateLabelTransitions() {
//        let animationClosure = {
//            () -> Void in
//            self.questionLabel.alpha = 1
//        }
//        // animate the alpha
//        UIView.animate(withDuration: 1.5, animations: animationClosure)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [],
                       animations: {
//            self.questionLabel.alpha = 1
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        },
                       completion:{
                        _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
        })
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        // set the label's initial alpha
//        questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }

}

