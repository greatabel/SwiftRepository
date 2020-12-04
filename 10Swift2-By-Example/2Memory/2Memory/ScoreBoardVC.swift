import UIKit

class ScoreBoardVC: UITableViewController {
 
 let cellId = "cellId"
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 setupTableView()

 }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
 
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
