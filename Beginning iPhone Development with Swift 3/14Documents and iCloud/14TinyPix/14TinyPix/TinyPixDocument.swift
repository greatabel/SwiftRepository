import UIKit

class TinyPixDocument: UIDocument {

    private var bitmap: [UInt8]

    override init(fileURL: URL) {
        bitmap = [0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80]
        super.init(fileURL: fileURL as URL)
    }

}
