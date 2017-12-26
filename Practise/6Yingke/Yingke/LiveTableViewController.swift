import UIKit

import Just
import Kingfisher

class LiveTableViewController: UITableViewController {

    let liveListUrl = "http://116.211.167.106/api/live/infos?id=1514272298910989%2C1514272384465502&multiaddr=1&lc=0000000000000082&cc=TG0001&cv=IK5.1.15_Iphone&proto=13&idfa=00000000-0000-0000-0000-000000000000&idfv=174AA6EA-3728-46CD-A1E5-C55A30B763E0&devi=be2ca64cf1fe7ea40505987e4123d94e11e3f620&osversion=ios_11.200000&ua=iPhone7_1&imei=&imsi=&uid=621506407&sid=20rDLEWxfRAggC5i05upxJJxjYkqg2Ftwd1sygc5nKbkWH7AtBi0&conn=wifi&mtid=0754dd79ca2312cca46dc913457918da&mtxid=1c872ce5e66c&logid=259,264,226,229&smid=D2uq77xJ1gJZFrj0a0pd/kp22g3UW9iWblUG7BadHTvZ4X3b&s_sg=c02893fc155eea224199a3251d026e2f&s_sc=100&s_st=1514272944"

    var list : [LiveCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadList()

        refreshControl = UIRefreshControl()
        
    }

    func loadList() {
        Just.post(liveListUrl) { (r) in
            guard let json = r.json as? NSDictionary else {
                return
            }
            let lives = YKLiveList(fromDictionary: json).lives!
            self.list = lives.map({ (live) -> LiveCell in
                return LiveCell(portrait: live.creator.portrait, addr: live.city, cover: "", viewers: live.onlineUsers, caster: live.creator.nick, url: live.streamAddr)
            })

            OperationQueue.main.addOperation({

                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            })

        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LiveTableViewCell
        let live = list[indexPath.row]
        
        cell.labelNick.text = live.caster
        cell.labelAddr.text = live.addr.isEmpty ? "未知星球" : live.addr
        cell.labelViewers.text = "\(live.viewers)"

        //头像
        let imgUrl = URL(string: live.portrait)

        cell.imgPortrait.kf.setImage(with: imgUrl)
        //封面
        cell.imgCover.kf.setImage(with: imgUrl)
        return cell
    }

}
