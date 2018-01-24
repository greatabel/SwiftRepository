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
        let v = UIView(frame: CGRect(100, 100, 50, 50))
        v.backgroundColor = .blue
        self.view.addSubview(v)
    }




}

