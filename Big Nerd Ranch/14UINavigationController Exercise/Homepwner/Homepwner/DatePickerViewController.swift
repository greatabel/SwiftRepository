import UIKit

class DatePickerViewController: UIViewController{

    // http://mlk-ios-programming-concepts.blogspot.com/2014/07/hvarll-hope-everyone-is.html

    @IBOutlet var datePicker: UIDatePicker!

    func formatDate(originalDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let strDate = dateFormatter.string(from: originalDate)
        return strDate

    }
    var item: Item! {
        didSet {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "YYYY-MM-dd"
//            let strDate = dateFormatter.string(from: originalDate)

            navigationItem.title = "original date:\(formatDate(originalDate: item.dateCreated))"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.date = item.dateCreated
    }

    @IBAction func dateValueChanged(sender:UIDatePicker)
    {
        print("--> dateValueChanged")
        navigationItem.title = "original date:\(formatDate(originalDate:sender.date))"
        item.dateCreated = sender.date
//        dateTextField.text = sender.date.description
    }

}

