import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfVowels(in string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u",
                                   "A", "E", "I", "O", "U"]
        var numberOfVowels = 0
//        for character in string.characters {
//            if vowels.contains(character) {
//                numberOfVowels += 1
//            }
//        }
        numberOfVowels = string.characters.reduce(0) {
            $0 + (vowels.contains($1) ? 1:0)
        }
        return numberOfVowels
    }

//    func makeHeadLine(from string: String) -> String {
//        let words = string.components(separatedBy: " ")
//        print("words:\(words)")
//        var headline = ""
//        for var word in words {
//            let firstCharacter = word.remove(at: word.startIndex)
//            print("firstCharacter-> \(firstCharacter) word-> \(word)")
//            headline += "\(String(firstCharacter).uppercased())\(word) "
//        }
//        print("0 headline->\(headline)")
//        headline.remove(at: headline.index(before: headline.endIndex))
//        print("1 headline->\(headline)")
//        return headline
//
////        return "This Is A Test Headline"
//    }
    func makeHeadLine(from string: String) -> String {
        let words = string.components(separatedBy: " ")
        let headlineWords = words.map { (word) -> String in
            var mutableWord = word
            let first = mutableWord.remove(at: mutableWord.startIndex)
            return String(first).uppercased() + mutableWord
        }
        return headlineWords.joined(separator: " ")
    }

}

