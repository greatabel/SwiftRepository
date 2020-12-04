import UIKit

class ScoreBoardVC: UITableViewController {
 private var which_player = 0
 var array0 = [Int]()
 var array1 = [Int]()
 var array2 = [Int]()
 var mycount = 0
 let cellId = "cellId"
    
 init(which_player: Int){
        
        self.which_player = which_player
        super.init(nibName:nil, bundle: nil)
        print(self.which_player, " player!")
        let defaults = UserDefaults.standard
        var array0 = [Int]()
        var array1 = [Int]()
        var array2 = [Int]()
        
        switch which_player {
        case 0:
            array0 = defaults.array(forKey:defaultsKeys.keyZero)  as? [Int] ?? [Int]()
            self.array0 = array0
            self.mycount = array0.count
        case 1:
            array1 = defaults.array(forKey:defaultsKeys.keyOne)  as? [Int] ?? [Int]()
            array2 = defaults.array(forKey:defaultsKeys.keyTwo)  as? [Int] ?? [Int]()
            self.array1 = array1
            self.array2 = array2
            self.mycount = array1.count + array2.count
        case 2:
            array1 = defaults.array(forKey:defaultsKeys.keyOne)  as? [Int] ?? [Int]()
            array2 = defaults.array(forKey:defaultsKeys.keyTwo)  as? [Int] ?? [Int]()
            self.array1 = array1
            self.array2 = array2
            self.mycount = array1.count + array2.count
        default:
            array0 = defaults.array(forKey:defaultsKeys.keyZero)  as? [Int] ?? [Int]()
        }
    }

 required init(coder aDecoder: NSCoder){
    fatalError("init(coder:) has not been implemented")
}

 deinit{
    print("deint")
}
    
 override func viewDidLoad() {
     super.viewDidLoad()
     
     setupTableView()

 }
    
//    @objc func dismissVC() {
//        self.dismiss(animated: true, completion: nil)
//    }
 
 func setupTableView(){
 //Registers a class for use in creating new table cells.
 tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
 
 }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
     }
     
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.mycount
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // https://medium.com/@yoellev8/how-to-uitableview-programmatically-with-swift-4-0-a75edd427c82
        
      let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
      if self.which_player == 0 {
            let score = self.array0[indexPath.row]
            cell.textLabel?.text = "1P,\(indexPath.row)th round,Score: \(score)"
       } else {
            if indexPath.row < self.array1.count {
            let score = self.array1[indexPath.row]
            cell.textLabel?.text = "Player_A,\(indexPath.row)th round,Score: \(score)"
            } else if indexPath.row  < self.mycount{
            let score = self.array2[indexPath.row - self.array1.count]
            cell.textLabel?.text = "Player_B,\(indexPath.row - self.array1.count)th round,Score: \(score)"
            }
        

        }
      return cell
    }
 
}
