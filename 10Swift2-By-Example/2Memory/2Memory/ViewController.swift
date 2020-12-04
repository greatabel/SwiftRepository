import UIKit

enum Difficulty{
    case Easy, Medium, Hard
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



private extension ViewController{
    func setup(){
        
        view.backgroundColor = UIColor.greenSea()
        
//        buildButtonCenter(center: CGPoint(x: view.center.x, y: view.center.y/2.0),
//                          title: "EASY", color: UIColor.emerald(), action: #selector(ViewController.onEasyTapped))
//        buildButtonCenter(center: CGPoint(x: view.center.x, y: view.center.y),
//                          title: "MEDIUM", color: UIColor.sunflower(), action: #selector(ViewController.onMediumTapped))
        buildButtonCenter(center: CGPoint(x: view.center.x, y: view.center.y/2.0),
                          title: "1-Player", color: UIColor.emerald(), action: #selector(ViewController.onHardTapped))
        
        buildButtonCenter(center: CGPoint(x: view.center.x-75, y: view.center.y),
                          title: "2-Players(A)", color: UIColor.sunflower(), action: #selector(ViewController.onTwoPlayersA))
        buildButtonCenter(center: CGPoint(x: view.center.x+75, y: view.center.y),
                          title: "2-Players(B)", color: UIColor.sunflower(), action: #selector(ViewController.onTwoPlayersB))
        
        
        buildButtonCenter(center: CGPoint(x: view.center.x-75, y: view.center.y*3.0/2.0),
                          title: "1P-ScoreBoard", color: UIColor.alizarin(), action: #selector(ViewController.onScoreBoardTapped_single))
        buildButtonCenter(center: CGPoint(x: view.center.x+75, y: view.center.y*3.0/2.0),
                          title: "2P-ScoreBoard", color: UIColor.alizarin(), action: #selector(ViewController.onScoreBoardTapped_double))
    }
    func buildButtonCenter(center: CGPoint, title: String, color: UIColor, action: Selector) {
        let button = UIButton()
        button.setTitle(title, for: [])
        
        button.frame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 200, height: 50))
        button.center = center
        button.backgroundColor = color
        
        button.addTarget(self, action: action, for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func onScoreBoardTapped_single(sender: UIButton){
        
        // https://ithelp.ithome.com.tw/articles/10206248

        let scoreboardVC = ScoreBoardVC(which_player: 0)
        
        let alertController = UIAlertController(title: "ScoreBoard", message: "RankList", preferredStyle: .alert)
        alertController.setValue(scoreboardVC, forKey: "contentViewController")
        let cancelAction = UIAlertAction(title: "Back", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
//        let navigationController = UINavigationController(rootViewController: scoreboardVC)
//        navigationController.pushViewController(scoreboardVC, animated: true)
//        self.navigationController?.pushViewController(scoreboardVC, animated: true)
//        present(scoreboardVC, animated: true, completion: nil)
    }
    
    @objc func onScoreBoardTapped_double(sender: UIButton){
        
        // https://ithelp.ithome.com.tw/articles/10206248

        let scoreboardVC = ScoreBoardVC(which_player: 1)
        
        let alertController = UIAlertController(title: "ScoreBoard", message: "RankList", preferredStyle: .alert)
        alertController.setValue(scoreboardVC, forKey: "contentViewController")
        let cancelAction = UIAlertAction(title: "Back", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
//        let navigationController = UINavigationController(rootViewController: scoreboardVC)
//        navigationController.pushViewController(scoreboardVC, animated: true)
//        self.navigationController?.pushViewController(scoreboardVC, animated: true)
//        present(scoreboardVC, animated: true, completion: nil)
    }
    
    
//    @objc func onMediumTapped(sender: UIButton){
//        newGameDifficulty(difficulty: .Medium)
//    }
    @objc func onTwoPlayersA(sender: UIButton){
        newGameDifficulty(difficulty: .Easy, which_player: 1)
    }
    @objc func onTwoPlayersB(sender: UIButton){
        newGameDifficulty(difficulty: .Easy, which_player: 2)
    }
    
    @objc func onHardTapped(sender: UIButton){
        newGameDifficulty(difficulty: .Hard, which_player: 0)
    }
    
    func newGameDifficulty(difficulty: Difficulty, which_player: Int){
        let gameviewController = MemoryViewController(difficulty: difficulty, which_player: which_player)
        present(gameviewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(gameviewController, animated: true)
    }
}


extension ViewController{
    
//    func onEasyTapped(sender: UIButton){
//        newGameDifficulty(difficulty: .Easy)
//    }
//
//    func onMediumTapped(sender: UIButton){
//        newGameDifficulty(difficulty: .Medium)
//    }
//
//    func onHardTapped(sender: UIButton){
//        newGameDifficulty(difficulty: .Hard)
//    }
//
//    func newGameDifficulty(difficulty: Difficulty){
//        let gameviewController = MemoryViewController(difficulty: difficulty)
//        present(gameviewController, animated: true, completion: nil)
//    }
    
    
}

