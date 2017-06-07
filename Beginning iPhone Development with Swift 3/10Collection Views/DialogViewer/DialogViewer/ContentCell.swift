import UIKit

class ContentCell: UICollectionViewCell {
    var label: UILabel!
    var text: String!
    var maxWidth: CGFont!

    class func sizeForContentString(s: String,
                                    forMaxWidth maxWidth: CGFont) -> CGSize {
        return CGSize.zero
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: self.contentView.bounds)
        label.isOpaque = false
        label.backgroundColor =
            UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = type(of: self).defaultFont()
        contentView.addSubview(label)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    }
}
