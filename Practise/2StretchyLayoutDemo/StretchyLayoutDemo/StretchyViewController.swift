import UIKit
import SnapKit

// https://medium.freecodecamp.org/tutorial-creating-stretchy-layouts-on-ios-using-auto-layout-3fa974fa5e28
class StretchyViewController: UIViewController, UIScrollViewDelegate {

    private let scrollView = UIScrollView()
    private let infoText = UILabel()
    private let imageView = UIImageView()
    private let textContainer = UIView()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray

        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self

        imageView.image = UIImage(named: "Header")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        infoText.textColor = .white
        infoText.numberOfLines = 0
        let text =  """
                    Lorem ipsum dolor sit amet, in alia adhuc aperiri nam. Movet scripta tractatos cu eum, sale commodo meliore ea eam, per commodo atomorum ea. Unum graeci iriure nec an, ea sit habeo movet electram. Id eius assum persius pro, id cum falli accusam. Has eu fierent partiendo, doming expetenda interesset cu mel, tempor possit vocent in nam. Iusto tollit ad duo, est at vidit vivendo liberavisse, vide munere nonumy sed ex.

                    Quod possit expetendis id qui, consequat vituperata ad eam. Per cu elit latine vivendum. Ei sit nullam aliquam, an ferri epicuri quo. Ex vim tibique accumsan erroribus. In per libris verear adipiscing. Purto aliquid lobortis ea quo, ea utinam oportere qui.
                    """
        infoText.text = text + text + text

        let imageContainer = UIView()
        imageContainer.backgroundColor = .darkGray

        textContainer.backgroundColor = .clear

        let textBacking = UIView()
        textBacking.backgroundColor = .red

        view.addSubview(scrollView)

        scrollView.addSubview(imageContainer)
        scrollView.addSubview(textBacking)
        scrollView.addSubview(textContainer)
        scrollView.addSubview(imageView)

        textContainer.addSubview(infoText)

        scrollView.snp.makeConstraints {
            make in

            make.edges.equalTo(view)
        }

        imageContainer.snp.makeConstraints {
            make in

            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(imageContainer.snp.width).multipliedBy(0.7)
        }

        imageView.snp.makeConstraints{
            make in

            make.left.right.equalTo(imageContainer)
            make.top.equalTo(view).priority(.high)
            make.height.greaterThanOrEqualTo(imageContainer.snp.height).priority(.required)
            make.bottom.equalTo(imageContainer.snp.bottom)
        }

        textContainer.snp.makeConstraints{
            make in

            make.top.equalTo(imageContainer.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(scrollView)
        }
        textBacking.snp.makeConstraints {
            make in

            make.left.right.equalTo(view)
            make.top.equalTo(textContainer)
            make.bottom.equalTo(view)
        }

        infoText.snp.makeConstraints {
            make in

            make.edges.equalTo(textContainer).inset(14)
        }

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        scrollView.scrollIndicatorInsets = view.safeAreaInsets
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
    }


}
