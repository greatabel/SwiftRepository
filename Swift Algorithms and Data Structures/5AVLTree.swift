import Foundation


public class AVLTree<T: Comparable> {

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

    func addNode(key: T){

        if(self.key == nil) {
            self.key = key
            self.height = 0
            return
        }

        if(key < self.key!) {
            if(self.left != nil) {
                left?.addNode(key: key)
            }
            else{
                let leftChild: AVLTree = AVLTree()
                leftChild.key = key
                leftChild.height = 0
                self.left = leftChild
            }

        }
    }

    func getNodeheight(aNode: AVLTree!) -> Int {
        if(aNode == nil) {
            return -1
        }
        else {
            return aNode.height
        }
    }

    // caclulate the height of a Node
    func setNodeHeight() -> Bool {

        if(self.key == nil) {
            print("no key provided..")
            return false
        }
        var nodeHeight: Int = 0

        nodeHeight = max(getNodeheight(aNode: self.left), getNodeheight(aNode: self.right)) + 1
        self.height = nodeHeight
        return true
    }


}
