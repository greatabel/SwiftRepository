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
            print(self.setNodeHeight())
            print("traversing left side. node \(self.key!) with height: \(self.height)...")
            print(self.isValidAVLTree())

        }

        if (key > self.key!) {

            if (self.right != nil) {
                right?.addNode(key: key)
            }
            else {
                //create a new right node
                let rightChild : AVLTree = AVLTree()
                rightChild.key = key
                rightChild.height = 0
                self.right = rightChild
            }
            //recalculate node height for hierarchy
            print(self.setNodeHeight())
            print("traversing right side. node \(self.key!) with height: \(self.height)...")
            //check AVL property
            print(self.isValidAVLTree())
        } //end if
    }

    func isTreeBalanced() -> Bool {
        if (self.key == nil) {
            print("no key provided..")
            return false
        }
        if (abs(getNodeHeight(aNode: self.left) - getNodeHeight(aNode: self.right)) <= 1) {
            return true
        }
        else {
            return false
        }
    }

    func isValidAVLTree() -> Bool! {

        if(self.key == nil) {
            print("no key provided")
            return false
        }
        if (self.isTreeBalanced() == true) {
            print("node \(self.key!) already balanced..")
            return true
        }
        else {

            let childToUse : AVLTree = AVLTree()
            childToUse.height = 0
            childToUse.key = self.key
            if (getNodeHeight(aNode: self.left) - getNodeHeight(aNode: self.right) > 1) {

                print("\n starting right rotation on \(self.key!)..")


                //reset the root node
                self.key = self.left?.key
                self.height = getNodeHeight(aNode: self.left)


                //assign the new right node
                self.right = childToUse


                //adjust the left node
                self.left = self.left?.left
                self.left?.height = 0

                print("root is: \(self.key!) | left is : \(self.left!.key!) | right is : \(self.right!.key!)..")

                return true

            }


            if (getNodeHeight(aNode: self.right) - getNodeHeight(aNode: self.left) > 1) {

                print("\n starting left rotation on \(self.key!)..")

                //reset the root node
                self.key = self.right?.key
                self.height = getNodeHeight(aNode: self.right)


                //assign the new left node
                self.left = childToUse


                //adjust the right node
                self.right = self.right?.right
                self.right?.height = 0

                print("root is: \(self.key!) | left is : \(self.left!.key!) | right is : \(self.right!.key!)..")

                return true
                
            }
            return nil

        }

    }

    func getNodeHeight(aNode: AVLTree!) -> Int {
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

        nodeHeight = max(getNodeHeight(aNode: self.left), getNodeHeight(aNode: self.right)) + 1
        self.height = nodeHeight
        return true
    }


}
