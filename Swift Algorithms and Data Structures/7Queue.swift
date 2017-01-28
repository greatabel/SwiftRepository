import Foundation

public class Queue<T> {

    private var top: QNode<T>! = QNode<T>()

    var count: Int {



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
