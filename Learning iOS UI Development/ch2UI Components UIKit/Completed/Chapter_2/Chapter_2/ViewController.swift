import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeSlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func customizeSlider(){
        
        // YOUR CODE HERE -------------------------------
        // Initialize the images
        let minTrack = UIImage(named: "minTrack")
        let maxTrack = UIImage(named: "maxTrack")
        let thumb = UIImage(named: "thumb")  
        // Create resizable images
        let resizableMinTrack = minTrack?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
        let resizableMaxTrack = maxTrack?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))

        // Configure the styles!
        UISlider.appearance().setMaximumTrackImage(resizableMaxTrack, for: UIControlState())
        UISlider.appearance().setMinimumTrackImage(resizableMinTrack, for: UIControlState())
        UISlider.appearance().setThumbImage(thumb, for: UIControlState())



        // YOUR CODE HERE -------------------------------
    }

}

