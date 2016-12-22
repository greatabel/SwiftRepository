import Foundation

open class LinkedList<T: Equatable> {

    private var head: LLNode<T> = LLNode<T>()


    func printAllKeys() {

        var current: LLNode! = head
        print("--")
        while(current != nil) {
            print("link item is: \(current.key)")
            current = current.next
        }
    }

    func addLink(key: T) {
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


}
