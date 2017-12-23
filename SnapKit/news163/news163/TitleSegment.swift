import UIKit

class TitleSegment: UIView {


    var titleArray: Array<String>? {

        didSet {
            createTitleViews()
        }
    }
    lazy var scrollView: UIScrollView = {
        let temp = UIScrollView()
        temp.showsHorizontalScrollIndicator = false
        temp.backgroundColor = UIColor.red
        return temp
    }()

    override init(frame: CGRect) {

        super.init(frame: frame)

        scrollView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(scrollView)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createTitleViews() {
        for subview in self.scrollView.subviews {

            subview.removeFromSuperview()

        }
        let width: CGFloat = 80
        if let count = titleArray?.count {
            print("\(count)")
            for i in 0..<count {

                let button = UIButton()
                button.frame = CGRect(x: CGFloat(i) * width, y: 0, width: width
                    , height: frame.size.height)
                button.backgroundColor = UIColor.clear
                self.scrollView.addSubview(button)
                button.setTitleColor(UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1), for: UIControlState.normal)


                if let title = self.titleArray?[i] {
                    button.setTitle(title, for: .normal)
                }

            }
            
            scrollView.contentSize = CGSize(width: width * CGFloat(count),
                                            height: self.frame.size.height)
        }
    }



}
