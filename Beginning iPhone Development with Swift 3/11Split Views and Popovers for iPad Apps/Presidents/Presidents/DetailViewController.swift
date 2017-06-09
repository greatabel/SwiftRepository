import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var webView: UIWebView!

    private var languageListController: LanguageListController?
    private var languageButton: UIBarButtonItem?
//    var languageString = ""
    var languageString = "" {
        didSet {
            if languageString != oldValue {
                configureView()
            } }
    }


    private func modifyUrlForLanguage(url: String, language lang: String?) -> String {
        var newUrl = url
        // We're relying on a particular Wikipedia URL format here. This
        // is a bit fragile!
        if let langStr = lang {
            // URL is like https://en.wikipedia...
            let range = NSMakeRange(8, 2)
            if !langStr.isEmpty && (url as NSString).substring(with: range) != langStr {
                newUrl = (url as NSString).replacingCharacters(in: range,
                                                               with: langStr)
            } }
        return newUrl
    }


    func showLanguagePopover() {
        if languageListController == nil {
            // Lazy creation when used for the first time
            languageListController = LanguageListController()
            languageListController!.detailViewController = self
            languageListController!.modalPresentationStyle = .popover
        }
        present(languageListController!, animated: true, completion: nil)
        if let ppc = languageListController?.popoverPresentationController {
            ppc.barButtonItem = languageButton
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                let dict = detail 
//                let urlString = dict["url"]!
                label.text = dict["url"]
                let urlString = modifyUrlForLanguage(url: dict["url"]!, language: languageString)
                let url = NSURL(string: urlString)!
                let request = URLRequest(url: url as URL)
                webView.loadRequest(request)

                let name = dict["name"]!
                title = name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()

        languageButton = UIBarButtonItem(title: "Choose Language", style: .plain,
                                         target: self, action:
            #selector(DetailViewController.showLanguagePopover))
        navigationItem.rightBarButtonItem = languageButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: [String: String]? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

