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
        let index = segment.selectedSegmentIndex
        if currentSelectIndex != index {
            let target: [UIViewController] = [vcs[index]]
            let direction: UIPageViewControllerNavigationDirection = currentSelectIndex > index ? .reverse: .forward
            pageVC.setViewControllers(target, direction: direction, animated: false)
            { [weak self] (finish) in
                self?.currentSelectIndex = index
            }
        }
    }

    override func configUI() {
        
    }
}


extension UPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let index = vcs.index(of: viewController) else { return nil }
        let beforeIndex = index - 1
        guard beforeIndex >= 0 else {return nil}
        return vcs[beforeIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let index = vcs.index(of: viewController) else { return nil }
        let afterIndex = index + 1
        guard afterIndex <= vcs.count - 1 else { return nil }
        return vcs[afterIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        guard let viewController = pageViewController.viewControllers?.last,
            let index = vcs.index(of: viewController) else {
                return
        }
        currentSelectIndex = index
        segment.setSelectedSegmentIndex(UInt(index), animated: true)
        guard title != nil && pageStyle == .none else { return }
        navigationItem.title = titles[index]
    }


}

