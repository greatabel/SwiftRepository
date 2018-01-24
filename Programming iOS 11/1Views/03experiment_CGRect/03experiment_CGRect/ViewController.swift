import UIKit

extension CGRect {

    init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        self.init(x: x, y:y, width: w, height: h)
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let v = UIView(frame: CGRect(0, 0, 150, 150))
        v.backgroundColor = .blue
        self.view.addSubview(v)

        let v1 = UIView(frame:CGRect(113, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame:CGRect(41, 56, 132, 194))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame:CGRect(43, 197, 160, 230))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)

        self.view.addSubview(v1)
        v1.addSubview(v2)
        self.view.addSubview(v3)

        // bounds
        let v11 = UIView(frame:CGRect(213, 411, 132, 194))
        v11.backgroundColor = .blue
        let v22 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
        v22.backgroundColor = .red
        self.view.addSubview(v11)
        v11.addSubview(v22)
    }




}

