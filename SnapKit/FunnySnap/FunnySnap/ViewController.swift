import UIKit
import SnapKit

// https://medium.com/cocoaacademymag/how-to-write-auto-layout-constraints-with-snapkit-in-ios-c5f95c7c695d

class ViewController: UIViewController {

    let button = UIButton()
    var tapped = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown

        self.setupBottomRightButton()
        self.setupCustomNavBar()
        self.setupCustomDashboardView()

        self.updateConstraints()
    }

    func updateConstraints() {

        var widthConstraint: Constraint? = nil
        var heightConstraint: Constraint? = nil

        // snp_updateConstraints
        self.button.layer.cornerRadius = 22
        self.button.snp.updateConstraints { (make) -> Void in
            widthConstraint = make.width.equalTo(144).constraint
            heightConstraint = make.height.equalTo(144).constraint
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.right.equalTo(self.view.snp.right).offset(-20)
        }
        tapped = true

        // References
        widthConstraint?.deactivate()
        heightConstraint?.deactivate()
        widthConstraint?.update(offset: 100)
        heightConstraint?.update(offset: 100)

    }

    func setupBottomRightButton() {
        let superview = self.view

        button.layer.cornerRadius = 33
        button.setTitle("+", for: .normal)
        button.backgroundColor = UIColor.cyan
        superview?.addSubview(button)
        button.snp.makeConstraints {(make) -> Void in
            make.width.equalTo(66)
            make.height.equalTo(66)
            make.bottom.equalTo((superview?.snp.bottom)!).offset(-20)
            make.right.equalTo((superview?.snp.right)!).offset(-20)
        }
        button.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
    }

    func setupCustomNavBar() {
        let superview = self.view
        let navbar = UIView()
        superview?.addSubview(navbar)
        navbar.backgroundColor = UIColor(red:0.48, green:0.45, blue:0.78, alpha:1)
        navbar.snp.makeConstraints{(make) -> Void in
            make.height.equalTo(64)
            make.width.equalTo(superview!)
        }

        let titleLabel = UILabel()
        navbar.addSubview(titleLabel)
        titleLabel.text = "FunnySnap"
        titleLabel.textColor = UIColor.black
        titleLabel.sizeToFit()
        titleLabel.snp.makeConstraints{
            (make) -> Void in
            make.center.equalTo(navbar)
        }

    }

    func setupCustomDashboardView() {
        let superview = self.view
        let dashboardView = UIView()
        let miniView1 = UIView()
        let miniView2 = UIView()
        let bigView = UIView()
        let miniLabel = UILabel()
        let dashboardLabel = UILabel()

        superview?.addSubview(dashboardView)
        dashboardView.addSubview(miniView1)
        dashboardView.addSubview(miniView2)
        dashboardView.addSubview(bigView)
        miniView1.addSubview(miniLabel)
        bigView.addSubview(dashboardLabel)

        dashboardView.backgroundColor = UIColor.yellow
        miniView1.backgroundColor = UIColor.white
        miniView2.backgroundColor = UIColor.lightGray
        bigView.backgroundColor = UIColor.black

        miniLabel.textColor = UIColor.white
        miniLabel.text = "MiniBox"
        miniLabel.backgroundColor = UIColor.black
        miniLabel.textAlignment = .center

        dashboardLabel.textColor = UIColor.white
        dashboardLabel.text = "Dashboard"

        dashboardView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(superview!).multipliedBy(0.9)
            make.height.equalTo(256)
            make.top.equalTo(superview!).offset(84)
            make.centerX.equalTo(superview!)
        }

        miniView1.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(dashboardView).offset(24)
            make.top.equalTo(dashboardView).offset(20)
            make.width.equalTo(dashboardView).dividedBy(2.5)
            make.height.equalTo(dashboardView).multipliedBy(0.4)
        }

        miniView2.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(miniView1.snp.right).offset(20)
            make.top.equalTo(dashboardView).offset(20)
            make.size.equalTo(miniView1)
        }

        bigView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(dashboardView).offset(24)
            make.top.equalTo(miniView1.snp.bottom).offset(20)
            make.right.equalTo(dashboardView).offset(-24)
            make.bottom.equalTo(dashboardView).offset(-20)
        }

        miniLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(miniView1).inset(UIEdgeInsetsMake(5, 5, 5, 5))
        }

        dashboardLabel.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(bigView)
        }

    }

    @objc func customButtonTapped() {
        self.modifyConstraints()
    }

    func modifyConstraints() {
//        print(#function)
        if tapped {
            button.layer.cornerRadius = 33
            self.button.snp.remakeConstraints{(make) -> Void in
                make.width.equalTo(66)
                make.height.equalTo(66)
                make.bottom.equalTo(self.view.snp.bottom).offset(-20)
                make.right.equalTo(self.view.snp.right).offset(-20)
            }
            tapped = false
        } else {
            button.layer.cornerRadius = 22
            self.button.snp.remakeConstraints{(make) -> Void in
                make.width.equalTo(44)
                make.height.equalTo(44)
                make.bottom.equalTo(self.view.snp.bottom).offset(-20)
                make.left.equalTo(self.view).offset(20)
            }
            tapped = true
        }

    }

}

