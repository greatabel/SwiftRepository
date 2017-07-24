import UIKit

class TinyPixDocument: UIDocument {

    private var bitmap: [UInt8]

    override init(fileURL: URL) {
        bitmap = [0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80]
        super.init(fileURL: fileURL as URL)
    }

    func stateAt(row: Int, column: Int) -> Bool {
        let rowByte = bitmap[row]
        let result = UInt8(1 << column) & rowByte
        return result != 0
    }

    func setState(state: Bool, atRow row: Int, column: Int) {
        var rowByte = bitmap[row]
        if state {
            rowByte |= UInt8(1 << column)
        } else {
            rowByte &= ~UInt8(1 << column)
        }
        bitmap[row] = rowByte
    }

    func toggleStateAt(row: Int, column: Int) {
        let state = stateAt(row: row, column: column)
        setState(state: !state, atRow: row, column: column)
    }

}
