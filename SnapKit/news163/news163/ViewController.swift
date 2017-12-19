import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    MARK: - Property
    var textLabel: UILabel = UILabel()
    var textButton: UIButton = UIButton()
    var tableView: UITableView = UITableView()

//    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

