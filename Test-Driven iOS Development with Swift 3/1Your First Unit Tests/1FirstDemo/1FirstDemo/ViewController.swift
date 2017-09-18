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

}

