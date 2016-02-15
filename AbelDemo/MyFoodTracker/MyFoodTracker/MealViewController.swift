import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,
   UIImagePickerControllerDelegate, UINavigationControllerDelegate {


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

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // hide keyboard
        textField.resignFirstResponder()
        return true
    }

    // MARK: UIImagePickerControllerDelegate

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage

        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage

        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }



    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        print("in select")
        // hide the keyboard
        // Hide the keyboard.
        nameTextField.resignFirstResponder()

        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()

        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary

        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self

        presentViewController(imagePickerController, animated: true, completion: nil)
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let birthday = birthdayTextField.text ?? ""

            meal = Meal(name: name, birthday: birthday, photo: photo)
        }
    }

    
  

}
