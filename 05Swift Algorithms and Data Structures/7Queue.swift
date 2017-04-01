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

    func peek() -> T? {
        return top.key!
    }

    func enQueue(key: T) {

        if(top == nil ) {
            top = QNode<T>()
        }

        if(top.key == nil) {
            top.key = key
            return
        }

        let childToUse: QNode<T> = QNode<T>()
        var current: QNode = top

        while(current.next != nil) {
            current = current.next!
        }
        childToUse.key = key
        current.next = childToUse
    }

    func deQueue() -> T? {
        let topitem: T? = self.top?.key
        if( topitem == nil ) {
            return nil
        }

        let queueitem: T? = top.key!
        if let nextitem = top.next {
            top = nextitem
        } else {
            top = QNode<T>()
        }
        return queueitem
    }
}
