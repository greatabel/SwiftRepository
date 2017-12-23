import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let firstURL = "http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html?from=toutiao&passport=&devId=ECIDH5J3VtJNmnlsgmFGFUgU324iLqCs%2FTN6KzBE6GrzJ6En48foT5R9wH%2FOcJXY&size=20&version=6.0&spever=false&net=wifi&lat=BNsQafMiQurgbJgINKDqOA%3D%3D&lon=bSHK%2B1pn5rA0G0bX3U5%2FOQ%3D%3D&ts=1460300866&sign=sZkXOQmPZa571vREFlmf4Ko0tVPzkKGHYxTTQ3x8M1N48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"

    let CellSnap  = "SnapTableViewCell"
    let CellImage = "ImageTableViewCell"

    var newsArray: NSArray = []

    //    MARK: - Property
    lazy var topView: ScrollImageView = {
        let temp = ScrollImageView.init(frame:
            CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 190))
        return temp
    }()

    var tableView: UITableView = UITableView()

    lazy var segment : TitleSegment = {

        let temp = TitleSegment.init(frame: CGRect(x: 0, y: 20, width: self.view.bounds.width, height: 30))
        temp.titleArray = ["头条", "娱乐", "热点" ,"体育" ,"北京", "网易", "财经", "科技"]
        

        return temp

    }()

    //    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavgationBar()
        addSubView()
        setupSubview()
        setupLayout()
        getDataFromServer()

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

        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray

    }

    func addSubView() {


        self.view.addSubview(tableView)
        self.view.addSubview(segment)
    }

    func setupLayout() {
        tableView.frame = CGRect(x: 0, y: 50,
                                 width: self.view.bounds.width, height: self.view.bounds.height - 30)
    }

    func setupSubview() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.tableView.rowHeight = 100
        self.tableView.register(SnapTableViewCell.self, forCellReuseIdentifier: CellSnap)
        self.tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: CellImage)
    }

    //    MARK: - Private
    func getDataFromServer() {
        let url = firstURL
        Alamofire.request(url, method:.get).responseJSON { response in

            switch response.result {
            case .success(let data):
                let json = JSON(data)

                let adArray: Array<JSON> = json["T1348647853363"][0]["ads"].arrayValue
                self.topView.imageURLArray = adArray.map({ adDic -> URL in

                    return URL(string: adDic["imgsrc"].stringValue)!
                })

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

}

