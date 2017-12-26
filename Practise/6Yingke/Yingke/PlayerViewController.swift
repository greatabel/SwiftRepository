import UIKit

class PlayerViewController: UIViewController {

    var live: LiveCell!
    
    @IBOutlet var imgBackground: UIImageView!
    @IBOutlet var backBtn: UIButton!

    @IBOutlet var giftBtn: UIButton!

    @IBOutlet var likeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dump(live)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapLike(_ sender: UIButton) {

    }

    @IBAction func tapGift(_ sender: UIButton) {

    }

    @IBAction func tapBack(_ sender: UIButton) {
        
    }

}
