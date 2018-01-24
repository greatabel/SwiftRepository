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
        let v = UIView(frame: CGRect(0, 0, 50, 50))
        v.backgroundColor = .blue
        self.view.addSubview(v)

        let v1 = UIView(frame:CGRect(113, 111, 132, 97))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame:CGRect(41, 56, 132, 97))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame:CGRect(43, 197, 160, 115))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)

        self.view.addSubview(v1)
        v1.addSubview(v2)
        self.view.addSubview(v3)

        // bounds
        let v11 = UIView(frame:CGRect(10, 411, 80, 80))
        v11.backgroundColor = .blue
        let v22 = UIView(frame:v11.bounds.insetBy(dx: 20, dy: 20))
        v22.backgroundColor = .red
        self.view.addSubview(v11)
        v11.addSubview(v22)

        let v111 = UIView(frame:CGRect(100, 411, 80, 80))
        v111.backgroundColor = .blue
        let v222 = UIView(frame:v111.bounds.insetBy(dx: 10, dy: 10))
        v222.backgroundColor = .red
        self.view.addSubview(v111)
        v111.addSubview(v222)
        v222.bounds.size.height += 16
        v222.bounds.size.width += 16

        let v4 = UIView(frame:CGRect(200, 411, 80, 80))
        v4.backgroundColor = .cyan
        let v5 = UIView(frame:v4.bounds.insetBy(dx: 10, dy: 10))
        v5.backgroundColor = .red
        self.view.addSubview(v4)
        v4.addSubview(v5)
        v4.bounds.origin.x += 20
        v4.bounds.origin.y += 20

        let v6 = UIView(frame:CGRect(300, 411, 80, 80))
        v6.backgroundColor = .green
        let v7 = UIView(frame:CGRect(350, 411,20,20))
        v7.backgroundColor = .red
        self.view.addSubview(v6)
        v6.addSubview(v7)
        v7.center = v6.convert(v6.center, from:v6.superview)

    }




}

