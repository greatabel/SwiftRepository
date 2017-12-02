import UIKit

class TwoColumnFlowLayout: UICollectionViewFlowLayout {
    private struct Constants {
        static let NumberColumns = CGFloat(2.0)
        static let InteritemSpacing = CGFloat(1.0)
    }

    override func prepare() {
        super.prepare()

        configureItemSpacing()
        configureItemSize()
    }
}

private extension TwoColumnFlowLayout {
    func configureItemSpacing() {
        minimumInteritemSpacing = Constants.InteritemSpacing
        minimumLineSpacing = Constants.InteritemSpacing
    }

    func configureItemSize() {
        let itemSide = (collectionViewContentSize.width / Constants.NumberColumns) - (Constants.InteritemSpacing * 0.5)
        itemSize = CGSize(width:itemSide, height:itemSide)
    }
}
