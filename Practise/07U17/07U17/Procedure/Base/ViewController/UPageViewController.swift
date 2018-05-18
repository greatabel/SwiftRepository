import UIKit
import HMSegmentedControl

enum UPageStyle {
    case none
    case navgationBarSegment
    case topTabBar
}

class UPageViewController: UBaseViewController{
    var pageStyle: UPageStyle!

    lazy var segment: HMSegmentedControl = {
        return HMSegmentedControl().then{
            $0.addTarget(self, action: #selector(changeIndex(segment:)),
                         for: .valueChanged)
        }
    }()

    lazy var pageVC: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll,
                                    navigationOrientation: .horizontal,
                                    options: nil)
    }()

    private(set) var vcs: [UIViewController]!
    private(set) var titles:[String]!
    private var currentSelectIndex: Int = 0

    convenience init(titles: [String] = [], vcs: [UIViewController] = [],
                     pageStyle: UPageStyle = .none) {
        self.init()
        self.titles = titles
        self.vcs = vcs
        self.pageStyle = pageStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func changeIndex(segment: UISegmentedControl) {

    }

    override func configUI() {
        
    }
}
