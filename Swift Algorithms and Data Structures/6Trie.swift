import Foundation

public class Trie {

    private var root: TrieNode!

    init() {
        root = TrieNode()
    }

    func addWord(keyword: String) {
        if keyword.characters.count == 0 {
            return
        }

        var current: TrieNode = root
        while(keyword.characters.count != current.level) {
            var childToUse: TrieNode!
            let index = keyword.index(keyword.startIndex, offsetBy: current.level + 1)
            let searchKey: String = keyword.substring(to: index)
            print("current has \(current.children.count) children..")

            for child in current.children {

                if(child.key == searchKey) {
                    childToUse = child
                    
                }
            }
            if( childToUse == nil) {
                // create a new node
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            current = childToUse


        } // end of while

        if(keyword.characters.count == current.level) {
            current.isFinal = true
            print("end of word reached!")
            return
        }
    }

}
