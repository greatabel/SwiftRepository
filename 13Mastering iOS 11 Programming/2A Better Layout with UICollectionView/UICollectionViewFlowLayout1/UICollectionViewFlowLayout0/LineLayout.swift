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

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        print("newBounds=\(newBounds)")
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)

        //可见矩阵
        let visiableRect = CGRect(x: self.collectionView!.contentOffset.x, y:self.collectionView!.contentOffset.y, width:self.collectionView!.frame.width, height:self.collectionView!.frame.height)

        //接下来的计算是为了动画效果
        let maxCenterMargin = self.collectionView!.bounds.width * 0.5 + itemW * 0.5;
        //获得collectionVIew中央的X值(即显示在屏幕中央的X)
        let centerX = self.collectionView!.contentOffset.x + self.collectionView!.frame.size.width * 0.5;
        for attributes in array! {
            //如果不在屏幕上，直接跳过
            if !visiableRect.intersects(attributes.frame) {continue}
            let scale = 1 + (0.8 - abs(centerX - attributes.center.x) / maxCenterMargin)
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }

        return array
    }


  

}
