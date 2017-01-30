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


}
