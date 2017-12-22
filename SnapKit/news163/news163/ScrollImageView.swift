import UIKit

class ScrollImageView: UIView, UIScrollViewDelegate {

    var imageURLArray: Array<URL>? {
        didSet {
            createImageViews()
        }
    }

    var scrollView: UIScrollView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollView = UIScrollView.init(frame:
            CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            )
        scrollView?.isPagingEnabled = true
        scrollView?.delegate = self
        self.addSubview(scrollView!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not implement")
    }

    func createImageViews() {
        for subview in scrollView!.subviews {
            subview.removeFromSuperview()
        }
        if let count = imageURLArray?.count {

            for index in 0..<count {
                let imageView = UIImageView()
                imageView.frame = CGRect(x: CGFloat(index) * self.frame.size.width,
                                         y: 0,
                                         width: self.frame.size.width,
                                         height: self.frame.height)
                scrollView!.addSubview(imageView)

                if let url = imageURLArray?[index] {
                    imageView.kf.setImage(with: url)
                }

            }
            let imageleft = UIImageView.init(frame: CGRect(x: -self.frame.size.width,
                                                           y: 0, width: self.frame.size.width,
                                                           height: self.frame.size.height))
            scrollView!.addSubview(imageleft)
            if let url = imageURLArray?[count - 1] {
                imageleft.kf.setImage(with: url)
            }

            let imageright = UIImageView.init(frame:
                CGRect(x: CGFloat(count) * self.frame.size.width, y: 0,
                       width: self.frame.size.width, height: self.frame.size.height))
            scrollView!.addSubview(imageright)
            if let url = imageURLArray?[0] {
                imageright.kf.setImage(with: url)
            }

            scrollView?.contentSize = CGSize(width: CGFloat(count) * self.frame.size.width,
                                             height:self.frame.size.height)

        }
    }

}
