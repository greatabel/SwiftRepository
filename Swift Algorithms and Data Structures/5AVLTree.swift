import Foundation


public class AVLTree<T> {

    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    var height: Int

    init() {
        self.height = -1
    }

    var count: Int {
        let left = self.left?.count ?? 0
        let right = self.right?.count ?? 0
        return left + 1 + right
    }
    


}
