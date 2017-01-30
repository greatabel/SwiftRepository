import Foundation

public class Queue<T> {

    private var top: QNode<T>! = QNode<T>()

    var count: Int {

        if(top.key == nil ) {
            return 0
        }
        else {
            var current: QNode<T> = top
            var x: Int = 1

            while(current.next != nil ) {
                current = current.next!
                x += 1
            }
            return x
        }
        
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
