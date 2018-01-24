import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!

    weak var lab1: UILabel!
    weak var lab2: UILabel!

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .allButUpsideDown
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let lab1 = UILabel(frame:CGRect(50,220,42,22))
        lab1.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        lab1.text = "Hi"
        self.view.addSubview(lab1)
        self.lab1 = lab1
        print(button, button.translatesAutoresizingMaskIntoConstraints)
        print(lab1, lab1.translatesAutoresizingMaskIntoConstraints)

        let lab2 = UILabel()
        lab2.translatesAutoresizingMaskIntoConstraints = false
        lab2.text = "Me"
        self.view.addSubview(lab2)
        self.lab2 = lab2
        print(lab2, lab2.translatesAutoresizingMaskIntoConstraints)


        // pin second label to first one

        NSLayoutConstraint.activate([
            lab2.topAnchor.constraint(equalTo: lab1.bottomAnchor, constant: 20),
            lab2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            ])

        // we also have a button; what if we pin the second label to that as well?
        NSLayoutConstraint.activate([
            lab2.widthAnchor.constraint(equalTo: button.widthAnchor)
            ])


        delay(2) {
            NSLayoutConstraint.listConstraints(nil)

        }
    }


}

