import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let big_o_notation = Big_O_Notation()
        big_o_notation.linearSearch(4)
        big_o_notation.binarySearch(4, imin: 2, imax: 10)
        print(big_o_notation.binarySearch([1,2,10,20], target: 2))

        // sorting
//        print("---sorting---")
//        let sorting = Sorting()
//        print(sorting.insertionSort([1,3,2,4]))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

