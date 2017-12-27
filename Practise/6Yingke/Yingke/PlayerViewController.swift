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
        //默认模糊主播头像背景
        setBg()
    }

//    func bringBtnTofront()  {
//        self.view.bringSubview(toFront: likeBtn)
//        self.view.bringSubview(toFront: backBtn)
//        self.view.bringSubview(toFront: giftBtn)
//    }

    func setBg()  {
        let imgUrl = URL(string: live.portrait)
        imgBackground.kf.setImage(with: imgUrl)
        imgBackground.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = imgBackground.bounds
        
        // 不然遮罩宽高不自适应
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        imgBackground.addSubview(effectView)
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
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
