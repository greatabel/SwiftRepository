import UIKit

class ScoreBoardVC: UITableViewController {
 private var which_player = 0
    
 let cellId = "cellId"
    
 init(which_player: Int){
        
        self.which_player = which_player
        super.init(nibName:nil, bundle: nil)
        print(self.which_player, " player!")
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
      return 5
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // https://medium.com/@yoellev8/how-to-uitableview-programmatically-with-swift-4-0-a75edd427c82
        
      let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
       cell.textLabel?.text = "Rank 0, Score 0"
      
      return cell
    }
 
}
