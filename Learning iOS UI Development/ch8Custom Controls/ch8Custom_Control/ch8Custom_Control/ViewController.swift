import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!

    var slider:ThermostatSlider?
    var handleColor:UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider = ThermostatSlider(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        slider?.translatesAutoresizingMaskIntoConstraints = false
        slider?.autoresizingMask = []
        view.addSubview(slider!)

        // Autolayout

        let cst_width = NSLayoutConstraint.constraints(withVisualFormat: "H:[slider(30)]",
                                                                       options: NSLayoutFormatOptions(),
                                                                       metrics: nil,
                                                                       views: ["slider":slider!])

        let cst_Y = NSLayoutConstraint.constraints(withVisualFormat: "V:|-150-[slider]-150-|",
                                                                   options: NSLayoutFormatOptions(),
                                                                   metrics: nil,
                                                                   views: ["slider":slider!])

        let cst_X = NSLayoutConstraint(
            item: slider!,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1,
            constant: 0)

        view.addConstraints(cst_Y)
        view.addConstraint(cst_X)
        slider!.addConstraints(cst_width)

        slider!.addTarget(self, action: #selector(updateLabel), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func updateLabel(){
        self.label?.text = "\(slider!.value)"
    }

    @IBAction func resetSlider(_ sender: Any) {
        self.slider?.value = 0
    }
    
}

