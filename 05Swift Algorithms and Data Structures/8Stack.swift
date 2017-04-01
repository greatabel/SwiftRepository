import Foundation


class Stack<T> {
    
    private var top: LLNode<T>! = LLNode<T>()
    
    var count: Int {
        let topitem: T? = self.top?.key
        if( topitem == nil ) {
            return 0
        }
        var current: LLNode = top
        var x: Int = 1

        while(current.next != nil ) {
            current = current.next!
            x += 1
        }
        return x
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
        if let topitem: T = self.top?.key {
            return topitem
        }
        else {
            return nil
        }
    }

    func push(key: T) {
        if (top == nil ) {
            top = LLNode<T>()
        }
        if (top.key == nil) {
            top.key = key
            return
        }
        else {
            let childToUse: LLNode<T> = LLNode<T>()
            childToUse.key = key
            childToUse.next = top
            top = childToUse
        }
    }

    func pop() -> T? {
        let topitem: T? = self.top?.key
        if( topitem == nil ) {
            return nil
        }
        let queueitem: T? = top.key!

        if let nextitem = top.next {
            top = nextitem
        }
        else {
            top = nil
        }
        return queueitem
    }


}
