import UIKit
import SnapKit

// https://medium.com/cocoaacademymag/how-to-write-auto-layout-constraints-with-snapkit-in-ios-c5f95c7c695d

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let superview = self.view
        let button = UIButton()
        button.layer.cornerRadius = 33
        button.setTitle("+", for: .normal)
        button.backgroundColor = UIColor.red
        superview?.addSubview(button)
        button.snp.makeConstraints {(make) -> Void in
            make.width.equalTo(66)
            make.height.equalTo(66)
            make.bottom.equalTo((superview?.snp.bottom)!).offset(-20)
            make.right.equalTo((superview?.snp.right)!).offset(-20)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

