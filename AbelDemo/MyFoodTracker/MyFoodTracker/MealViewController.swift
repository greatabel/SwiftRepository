import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var birthdayTextField: UITextField!

    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self

        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name

            photoImageView.image = meal.photo
            birthdayTextField.text = meal.birthday
        }
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        print("isPresentingInAddMealMode=", isPresentingInAddMealMode)
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popToRootViewControllerAnimated(true)
        }
    }

    
  

}
