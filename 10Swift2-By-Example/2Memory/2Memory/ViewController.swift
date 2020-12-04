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
        
        buildButtonCenter(center: CGPoint(x: view.center.x, y: view.center.y/2.0),
                          title: "EASY", color: UIColor.emerald(), action: #selector(ViewController.onEasyTapped))
        buildButtonCenter(center: CGPoint(x: view.center.x, y: view.center.y),
                          title: "MEDIUM", color: UIColor.sunflower(), action: #selector(ViewController.onMediumTapped))
        buildButtonCenter(center: CGPoint(x: view.center.x, y: view.center.y*3.0/2.0),
                          title: "HARD", color: UIColor.alizarin(), action: #selector(ViewController.onHardTapped))
        
        
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
    
    @objc func onEasyTapped(sender: UIButton){
        newGameDifficulty(difficulty: .Easy)
    }
    
    @objc func onMediumTapped(sender: UIButton){
        newGameDifficulty(difficulty: .Medium)
    }
    
    @objc func onHardTapped(sender: UIButton){
        newGameDifficulty(difficulty: .Hard)
    }
    
    func newGameDifficulty(difficulty: Difficulty){
        let gameviewController = MemoryViewController(difficulty: difficulty)
        present(gameviewController, animated: true, completion: nil)
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

