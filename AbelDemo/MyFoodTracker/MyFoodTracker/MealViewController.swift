import UIKit

class MealViewController: UIViewController, UINavigationControllerDelegate {


    @IBOutlet weak var saveButton: UIBarButtonItem!

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
