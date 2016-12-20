import Foundation

public class LinkedList<T: Equatable> {

    private var head: LLNode<T> = LLNode<T>()


    func printAllKeys() {

        var current: LLNode! = head
        print("--")
        while(current != nil) {
            print("link item is: \(current.key)")
            current = current.next
        }
    }


}
