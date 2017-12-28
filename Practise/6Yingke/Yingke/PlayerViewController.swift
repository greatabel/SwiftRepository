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
        //爱心大小
        let heart = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

        //爱心的中心位置
        heart.center = CGPoint(x: likeBtn.frame.origin.x, y: likeBtn.frame.origin.y)

        view.addSubview(heart)
        heart.animate(in: view)

        //爱心按钮的 大小变化动画
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnime.values   = [1.0, 0.7, 0.5, 0.3, 0.5, 0.7, 1.0, 1.2, 1.4, 1.2, 1.0]
        btnAnime.keyTimes = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        btnAnime.duration = 0.2
        sender.layer.add(btnAnime, forKey: "SHOW")
    }

    @IBAction func tapGift(_ sender: UIButton) {
        let duration = 3.0
        let p918 = UIImageView(image: #imageLiteral(resourceName: "porsche"))

        p918.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(p918)

        let widthP918:CGFloat = 240
        let heightP918:CGFloat = 120

        UIView.animate(withDuration: duration) {
            p918.frame =
                CGRect(x: self.view.center.x - widthP918/2, y: self.view.center.y - heightP918/2, width: widthP918, height: heightP918)
        }


        //主线程延时一个完整动画后,再让礼物图片逐渐透明,完全透明后从父视图移除
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: duration, animations: {
                p918.alpha = 0
            }, completion: { (completed) in
                p918.removeFromSuperview()
            })
        }

        //烟花
        let layerFw = CAEmitterLayer()
        view.layer.addSublayer(layerFw)
        emmitParticles(from: sender.center, emitter: layerFw, in: view)

        DispatchQueue.main.asyncAfter(deadline: .now() + duration * 2) {
            layerFw.removeFromSuperlayer()
        }
        
    }

    @IBAction func tapBack(_ sender: UIButton) {
        self.player.stop()
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
