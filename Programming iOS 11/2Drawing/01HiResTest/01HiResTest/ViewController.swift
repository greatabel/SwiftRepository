import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var iv3: UIImageView!
    @IBOutlet weak var iv4: UIImageView!
    @IBOutlet weak var iv5: UIImageView!
    @IBOutlet weak var iv6: UIImageView!

    @IBOutlet weak var iv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.iv.image!.scale)

        // let's try out the new image literal feature
        // ooh, it works with code completion; you just type the name

        self.iv3.image = #imageLiteral(resourceName: "one") // behind the scenes: #imageLiteral with resourceName: param
        self.iv4.image = UIImage(named:"uno")

        if let s = Bundle.main.path(forResource: "one", ofType: "png") {
            self.iv5.image = UIImage(contentsOfFile: s)
        }
        if let s2 = Bundle.main.path(forResource: "uno", ofType: "png") {
            self.iv6.image = UIImage(contentsOfFile: s2)
        } else {
            print("looking for smiley")
            self.iv6.image = UIImage(named:"smiley")
        }

    }



}
