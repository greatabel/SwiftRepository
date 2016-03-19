/* http://www.ioscreator.com/tutorials/display-date-date-picker-ios8-swift
http://blog.apoorvmote.com/change-textfield-input-to-datepicker/

*/
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = UIDatePickerMode.Date
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.addTarget(self, action: Selector("datePickerChanged:"),
            forControlEvents: UIControlEvents.ValueChanged)
        dateLabel.text = "1989-12-12"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let converteddate = dateFormatter.dateFromString(dateLabel.text!) else {
            return
        }
        datePicker.date = converteddate

    }

    func datePickerChanged(datePicker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()

        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

