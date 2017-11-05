import UIKit
import HTPressableButton
import Cartography

func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}

class MenuViewController: UIViewController {

    private let playButton = HTPressableButton(frame: CGRectMake(0, 0, 260, 50),
                                               buttonStyle: .rect)
    private let gameCenterButton = HTPressableButton(frame: CGRectMake(0, 0, 260, 50),
                                                     buttonStyle: .rect)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        layoutView()
        style()
        render()
    }

}

private extension MenuViewController{
    func setup(){

    }
}

private extension MenuViewController{
    func layoutView(){

    }
}
private extension MenuViewController{
    func style(){

    }
}

private extension MenuViewController{
    func render(){

    }
}

