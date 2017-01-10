import Foundation

open class LinkedList<T: Equatable> {

    private var head: LLNode<T> = LLNode<T>()


    func printAllKeys() {
        var current: LLNode! = head
        print("--")
        while(current != nil) {
            print("link item is: \(current.key) prev item: \(current.previous?.key) " +
            "next item is: \(current.next?.key)")
            current = current.next
        }
    }

    func addLink(_ key: T) {
        //establish the head node
        if (head.key == nil) {
            head.key = key
            return
        }

        //establish the iteration variables
        var current: LLNode? =  head
        while (current != nil) {

            if current?.next == nil {
                let childToUse: LLNode = LLNode<T>()

                childToUse.key = key
                childToUse.previous = current
                current!.next = childToUse
                break
            }
            else {
                current = current?.next
            }
        } //end while

    }


    func isEmpty() -> Bool {
        return self.count == 0 || head.key == nil
    }


    var count: Int {
        if head.key == nil {
            return 0
        } else{
            var current: LLNode = head
            var x: Int = 1
            while current.next != nil {
                current = current.next!
                x += 1
            }
            return x
        }
    }

    func removeLinkAtIndex(index: Int) {
        
    }

    func linkAtIndex(index: Int) ->LLNode<T>! {
        if ((index < 0) || (index > (self.count - 1)) || (head.key == nil)) {
            return nil
        }
        else {
            var current: LLNode<T>! = head
            var x: Int = 0
            while(index != x) {
            current = current.next
            x += 1
            }
            return current
        }

    }

}
