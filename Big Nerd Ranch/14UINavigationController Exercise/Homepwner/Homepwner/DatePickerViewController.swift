import UIKit

class DatePickerViewController: UIViewController{

    @IBOutlet var datePicker: UIDatePicker!

    var originalDate: Date! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"

            let strDate = dateFormatter.string(from: originalDate)
            navigationItem.title = "original date:\(strDate)"
        }
    }

}

