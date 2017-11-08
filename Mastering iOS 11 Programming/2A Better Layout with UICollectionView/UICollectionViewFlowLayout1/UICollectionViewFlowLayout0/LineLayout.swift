import UIKit

class LineLayout: UICollectionViewFlowLayout {
    var itemW: CGFloat = 100
    var itemH: CGFloat = 100

    override init() {
        super.init()

        self.itemSize = CGSize(width: itemW, height: itemH)

        self.scrollDirection = .horizontal
        self.minimumLineSpacing = 0.7 * itemW
    }

    override func prepare() {
        let inset = (self.collectionView?.bounds.width ?? 0) * 0.5 - self.itemSize.width * 0.5
        self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
