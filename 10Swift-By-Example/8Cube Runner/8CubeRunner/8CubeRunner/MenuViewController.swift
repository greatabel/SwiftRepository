import UIKit
import HTPressableButton
import Cartography
import BitwiseFont

func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}

class MenuViewController: UIViewController {

    private let playButton = HTPressableButton(frame: CGRectMake(0, 0, 260, 50),
                                               buttonStyle: .rect)
    private let gameCenterButton = HTPressableButton(frame: CGRectMake(0, 0, 260, 50),
                                                     buttonStyle: .rect)
    private let titleLbl = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        layoutView()
        style()
        render()
    }
}

private extension MenuViewController{
    func setup(){
        playButton?.addTarget(self, action: #selector(self.onPlayPressed(sender:)),
                              for: .touchUpInside)
        view.addSubview(playButton!)
        gameCenterButton?.addTarget(self, action: #selector(self.onGameCenterPressed(sender:)),
                                    for: .touchUpInside)
        view.addSubview(gameCenterButton!)
        view.addSubview(titleLbl)

    }
    @objc func onPlayPressed(sender: UIButton) {
        print(#function)
        let vc = GameViewController()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }

    @objc func onGameCenterPressed(sender: UIButton) {
        print(#function)

    }


}

private extension MenuViewController{
    func layoutView(){
        constrain(titleLbl) { view in
            view.top == view.superview!.top + 60
            view.centerX == view.superview!.centerX
        }
        constrain(playButton!) { view in
            view.bottom == view.superview!.centerY - 60
            view.centerX == view.superview!.centerX
            view.height == 80
            view.width == view.superview!.width - 40
        }
        constrain(gameCenterButton!) { view in
            view.bottom == view.superview!.centerY + 60
            view.centerX == view.superview!.centerX
            view.height == 80
            view.width == view.superview!.width - 40
        }

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
