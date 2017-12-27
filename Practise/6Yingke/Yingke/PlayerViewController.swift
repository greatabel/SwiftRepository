import UIKit
import Player

class PlayerViewController: UIViewController {

    var live: LiveCell!
    var playerView: UIView!

    @IBOutlet var imgBackground: UIImageView!
    @IBOutlet var backBtn: UIButton!

    @IBOutlet var giftBtn: UIButton!

    @IBOutlet var likeBtn: UIButton!

    fileprivate var player = Player()

    // MARK: object lifecycle
    deinit {
        self.player.willMove(toParentViewController: self)
        self.player.view.removeFromSuperview()
        self.player.removeFromParentViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //默认模糊主播头像背景
        setBg()






        setPlayerView()

        //把按钮提升到view最前面
        bringBtnTofront()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.player.playFromBeginning()
    }


    func bringBtnTofront()  {
        self.view.bringSubview(toFront: likeBtn)
        self.view.bringSubview(toFront: backBtn)
        self.view.bringSubview(toFront: giftBtn)
    }



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

    func setPlayerView()  {
        self.playerView = UIView(frame: view.bounds)
        view.addSubview(self.playerView)

        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.view.frame = self.playerView.bounds
        let pv = self.player.view!
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerView.insertSubview(pv, at: 1)

        //        self.addChildViewController(self.player)
        //        self.view.addSubview(self.player.view)

        //        self.player.didMove(toParentViewController: self)


        var videoURL = URL(string: live.url)
        videoURL = URL(string: "https://v.cdn.vine.co/r/videos/AA3C120C521177175800441692160_38f2cbd1ffb.1.5.13763579289575020226.mp4")!

        self.player.url = videoURL

        self.player.playbackLoops = true
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

// MARK: - PlayerDelegate
extension PlayerViewController:PlayerDelegate {

    func playerReady(_ player: Player) {
    }

    func playerPlaybackStateDidChange(_ player: Player) {
    }

    func playerBufferingStateDidChange(_ player: Player) {
    }

    func playerBufferTimeDidChange(_ bufferTime: Double) {

    }

}

// MARK: - PlayerPlaybackDelegate
extension PlayerViewController:PlayerPlaybackDelegate {

    func playerCurrentTimeDidChange(_ player: Player) {
    }

    func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }

    func playerPlaybackDidEnd(_ player: Player) {
    }

    func playerPlaybackWillLoop(_ player: Player) {
    }

}
