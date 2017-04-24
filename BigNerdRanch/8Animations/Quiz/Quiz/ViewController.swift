import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!

    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!

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

        updateOffScreenLabel()
    }

    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
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
        // force any outstanding layout changes to occur
        view.layoutIfNeeded()

//        let animationClosure = {
//            () -> Void in
//            self.questionLabel.alpha = 1
//        }
//        // animate the alpha
//        UIView.animate(withDuration: 1.5, animations: animationClosure)

        // and the center X constraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth

//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       options: [.curveLinear],
//                       animations: {
////            self.questionLabel.alpha = 1
//            self.currentQuestionLabel.alpha = 0
//            self.nextQuestionLabel.alpha = 1
//
//            self.view.layoutIfNeeded()
//        },
//                       completion:{
//                        _ in
//                        swap(&self.currentQuestionLabel,
//                             &self.nextQuestionLabel)
//
//                        swap(&self.currentQuestionLabelCenterXConstraint,
//                             &self.nextQuestionLabelCenterXConstraint)
//
//                        self.updateOffScreenLabel()
//        })
        // bronze challenge 弹簧效果
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.5,
                       options: [.curveLinear],
                       animations: {
                        //            self.questionLabel.alpha = 1
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1

                        self.view.layoutIfNeeded()
        },
                       completion:{
                        _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)

                        swap(&self.currentQuestionLabelCenterXConstraint,
                             &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
        })
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        // set the label's initial alpha
//        questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }

}

