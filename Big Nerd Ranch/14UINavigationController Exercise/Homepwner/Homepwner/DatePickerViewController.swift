import UIKit

class DatePickerViewController: UIViewController{

    @IBOutlet var datePicker: UIDatePicker!

    func formatDate(originalDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let strDate = dateFormatter.string(from: originalDate)
        return strDate

    }
    var originalDate: Date! {
        didSet {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "YYYY-MM-dd"
//            let strDate = dateFormatter.string(from: originalDate)

            navigationItem.title = "original date:\(formatDate(originalDate: originalDate))"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.date = originalDate
    }

    @IBAction func dateValueChanged(sender:UIDatePicker)
    {
        print("--> dateValueChanged")
        navigationItem.title = "original date:\(formatDate(originalDate:sender.date))"
//        dateTextField.text = sender.date.description
    }

}

