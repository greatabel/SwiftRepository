import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let firstURL = "http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html?from=toutiao&passport=&devId=ECIDH5J3VtJNmnlsgmFGFUgU324iLqCs%2FTN6KzBE6GrzJ6En48foT5R9wH%2FOcJXY&size=20&version=6.0&spever=false&net=wifi&lat=BNsQafMiQurgbJgINKDqOA%3D%3D&lon=bSHK%2B1pn5rA0G0bX3U5%2FOQ%3D%3D&ts=1460300866&sign=sZkXOQmPZa571vREFlmf4Ko0tVPzkKGHYxTTQ3x8M1N48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"

    //    MARK: - Property
    var textLabel: UILabel = UILabel()
    var textButton: UIButton = UIButton()
    var tableView: UITableView = UITableView()

    
    //    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getDataFromServer()
        setupNavgationBar()
        addSubView()
        setupSubview()
        setupLayout()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    //    MARK: - ViewSetup
    func setupNavgationBar() {
        
    }

    func addSubView() {
        self.view.addSubview(textLabel)
        self.view.addSubview(textButton)
        self.view.addSubview(tableView)
    }

    func setupSubview() {
        textButton.isEnabled = false
    }

    func setupLayout() {
        textButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        tableView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    }

    //    MARK: - Private
    func getDataFromServer() {
        Alamofire.request(firstURL, method: .get).responseJSON  {
            response in
            print(response)
        }
    }
    
    func handleData() {
        
    }
    //    MARK: - Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

