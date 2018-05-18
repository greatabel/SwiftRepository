import UIKit

class UHomeViewController: UPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configNavigationBar() {
        super.configNavigationBar()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(selectAction))

    }
    @objc private func selectAction() {
        print(self)
    }
}
