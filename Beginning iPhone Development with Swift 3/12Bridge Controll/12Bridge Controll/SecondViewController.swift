import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var engineSwitch:UISwitch!
    
    @IBOutlet var warpFactorSlider:UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
    }

    func refreshFields() {
        let defaults = UserDefaults.standard
        engineSwitch.isOn = defaults.bool(forKey: warpDriveKey)
        warpFactorSlider.value = defaults.float(forKey: warpFactorKey)
    }

    @IBAction func onEngineSwitchTapped(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(engineSwitch.isOn, forKey: warpDriveKey)
    }
    @IBAction func onWarpSliderDragged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(warpFactorSlider.value, forKey: warpFactorKey)
    }


}

