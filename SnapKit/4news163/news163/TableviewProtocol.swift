import UIKit

let CellSnap  = "SnapTableViewCell"
let CellImage = "ImageTableViewCell"

class TableviewProtocol: NSObject, UITableViewDataSource, UITableViewDelegate{

    var newsArray: NSArray = []
    //    MARK: - Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data: NSDictionary = self.newsArray[indexPath.row] as! NSDictionary
        let url: URL = URL(string: data["img"] as! String)!
        if indexPath.row % 2 == 0 {
            let cell: SnapTableViewCell =
                tableView.dequeueReusableCell(withIdentifier: CellSnap) as! SnapTableViewCell



            cell.titleLabel.text = data["title"] as? String
            cell.detailLabel.text = data["digest"] as? String
            cell.testImageView.kf.setImage(with: url)
            return cell
        } else {
            let cell: ImageTableViewCell =
                tableView.dequeueReusableCell(withIdentifier: CellImage) as! ImageTableViewCell
            cell.titleLabel.text = data["title"] as? String
            cell.bigImageView.kf.setImage(with: url)
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 100
        } else {
            return 150
        }
    }
}
