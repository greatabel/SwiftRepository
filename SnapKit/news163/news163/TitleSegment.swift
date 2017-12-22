import UIKit

class TitleSegment: UIView {


    var titleArray: Array<String>? {

        didSet {

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
        fatalError("not implement")
    }
}
