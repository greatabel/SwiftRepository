import Foundation

public class Trie {

    private var root: TrieNode!

    func addWord(keyword: String) {
        if keyword.characters.count == 0 {
            return
        }

        var current: TrieNode = root
        while(keyword.characters.count != current.level) {
            var childToUse: TrieNode!
            var index = keyword.index(keyword.startIndex, offsetBy: current.level + 1)
            let searchKey: String = keyword.substring(to: index)
            print("current has \(current.children.count) children..")

        }

    }

}
