import UIKit
import Alamofire
import Kingfisher
import PullToRefresh
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
    TitleSegmentDelegate{

    let firstURL  = "http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html?from=toutiao&passport=&devId=ECIDH5J3VtJNmnlsgmFGFUgU324iLqCs%2FTN6KzBE6GrzJ6En48foT5R9wH%2FOcJXY&size=20&version=6.0&spever=false&net=wifi&lat=BNsQafMiQurgbJgINKDqOA%3D%3D&lon=bSHK%2B1pn5rA0G0bX3U5%2FOQ%3D%3D&ts=1460300866&sign=sZkXOQmPZa571vREFlmf4Ko0tVPzkKGHYxTTQ3x8M1N48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"

    let secondURL = "http://c.3g.163.com/nc/article/headline/T1348647853363/20-20.html?from=toutiao&passport=&devId=ECIDH5J3VtJNmnlsgmFGFUgU324iLqCs%2FTN6KzBE6GrzJ6En48foT5R9wH%2FOcJXY&size=20&version=7.0&spever=false&net=wifi&lat=&lon=&ts=1461501767&sign=mXgNK3x2QjdojToKQTv6IaORy9YlCvx7kPOlbxq9e2B48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"

    let CellSnap  = "SnapTableViewCell"
    let CellImage = "ImageTableViewCell"

    var newsArray: NSArray = []

    //    MARK: - Property
    lazy var segment : TitleSegment = {

        let temp = TitleSegment.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        temp.titleArray = ["头条", "娱乐", "热点" ,"体育" ,"北京", "网易", "财经", "科技"]
        temp.delegate = self

        return temp

    }()

    lazy var topView: ScrollImageView = {
        let temp = ScrollImageView.init(frame:
            CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 190))
        return temp
    }()

    lazy var tableView : UITableView = {

        let temp = UITableView.init(frame: CGRect(x: 0, y: 40,
                                    width: self.view.bounds.width,
                                    height: self.view.bounds.height - 40 - 64))

        return temp

    }()

    var refresher = PullToRefresh()


    //    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavgationBar()
        addSubView()
        setupSubview()
        setupLayout()
        getDataFromServer(input_url: "")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setupNavgationBar() {

        self.navigationController?.navigationBar.isTranslucent  = false

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.86, green: 0.2, blue: 0.22, alpha: 1)

    }

    func addSubView() {

        self.view.addSubview(segment)
        self.view.addSubview(tableView)

    }

    func setupLayout() {
//        tableView.frame = CGRect(x: 0, y: 40,
//                                 width: self.view.bounds.width, height: self.view.bounds.height - 40)
    }

    func setupSubview() {

        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.tableView.rowHeight = 100
        self.tableView.register(SnapTableViewCell.self, forCellReuseIdentifier: CellSnap)
        self.tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: CellImage)
        self.tableView.addPullToRefresh(self.refresher) {
            self.getDataFromServer(input_url: self.secondURL)
        }
    }

    //    MARK: - Private
    func getDataFromServer(input_url: String) {
        var url = firstURL
        if input_url != "" {
            url = input_url
        }
        Alamofire.request(url, method:.get).responseJSON { response in
            self.tableView.endAllRefreshing()
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                // seconde 没有这个广告
                if url == self.firstURL {
                    let adArray: Array<JSON> = json["T1348647853363"][0]["ads"].arrayValue
                    self.topView.imageURLArray = adArray.map({ adDic -> URL in

                        return URL(string: adDic["imgsrc"].stringValue)!
                    })
                }

                if let tempArray: NSArray = json["T1348647853363"].arrayObject as NSArray? {
                    let newsArray = tempArray.subarray(with: NSRange(location: 1,length: tempArray.count - 1))
                                    as NSArray
                    self.newsArray = newsArray
                    self.tableView.reloadData()

                }

                self.tableView.tableHeaderView = self.topView
                self.tableView.reloadData()

            case .failure( _):
                print("\(String(describing: response.result.error))")

            }

        }

    }
    
    func handleData() {
        
    }
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

    func buttonDidClicked(index: Int) {
        print(#function)
        print("index = \(index)")
    }
}

