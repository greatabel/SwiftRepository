import UIKit

class ViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var resultsTextView: UITextView!

    func fetchSomethingFromServer() -> String {
        Thread.sleep(forTimeInterval: 1)
        return "Hi there"
    }

    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.uppercased()
    }

    func calculateFirstResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 3)
        return "Number of chars: \(data.characters.count)"
    }

    func calculateSecondResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 4)
        return data.replacingOccurrences(of: "E", with: "e")
    }

    @IBAction func doWork(_ sender: AnyObject) {
        let startTime = NSDate()

        self.resultsTextView.text = ""
        let fetchedData = self.fetchSomethingFromServer()
        let processedData = self.processData(fetchedData)
        let firstResult = self.calculateFirstResult(processedData)
        let secondResult = self.calculateSecondResult(processedData)
        let resultsSummary =
        "First: [\(firstResult)]\nSecond: [\(secondResult)]"
        self.resultsTextView.text = resultsSummary
        let endTime = NSDate()
        print("Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

