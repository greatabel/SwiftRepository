import Foundation

public class Queue<T> {

    private var top: QNode<T>! = QNode<T>()

    var count: Int {

        if(top.key == nil ) {
            return 0
        }
        else {
            return 1
        }

        return 0
    }

    func isEmpty() -> Bool {

        if let _: T = self.top?.key {
            return false
        }
        else {
            return true
        }
    }
}
