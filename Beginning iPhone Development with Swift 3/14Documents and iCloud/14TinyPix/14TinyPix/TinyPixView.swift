import UIKit

struct GridIndex {
    var row: Int
    var column: Int
}

class TinyPixView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var document: TinyPixDocument!
    var lastSize: CGSize = CGSize.zero
    var gridRect: CGRect!
    var blockSize: CGSize!
    var gap: CGFloat = 0
    var selectedBlockIndex: GridIndex = GridIndex(row: NSNotFound, column: NSNotFound)

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        calculateGridForSize(bounds.size)
    }

    private func calculateGridForSize(_ size: CGSize){
        let space = min(size.width, size.height)
        gap = space / 57
        let cellSide = gap * 6
        blockSize = CGSize(width: cellSide, height: cellSide)
        gridRect = CGRect(x: (size.width - space)/2, y: (size.height - space)/2,
                          width: space, height: space)

    }


}
