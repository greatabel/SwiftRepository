import Foundation


public class AVLTree<T> {

    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    var height: Int

    init() {
        self.height = -1
    }

}
