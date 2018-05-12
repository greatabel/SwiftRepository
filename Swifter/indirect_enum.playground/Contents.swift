import UIKit

class Node<T> {
    let value: T?
    let next: Node<T>?

    init(value: T?, next: Node<T>?) {
        self.value = value
        self.next = next
    }

    
}

let list = Node(value: 1,
    next: Node(value: 2,
    next: Node(value: 3,
    next: Node(value: 4, next: nil))))

indirect enum LinkedList<Element: Comparable> {
    case Empty
    case Node(Element, LinkedList<Element>)

    
}
let linkedList = LinkedList.Node(1, .Node(2, .Node(3, .Node(4, .Empty))))
