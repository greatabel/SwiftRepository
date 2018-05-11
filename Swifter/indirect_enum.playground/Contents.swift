import UIKit

class Node<T> {
    let value: T?
    let next: Node<T>?

    init(value: T?, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}
