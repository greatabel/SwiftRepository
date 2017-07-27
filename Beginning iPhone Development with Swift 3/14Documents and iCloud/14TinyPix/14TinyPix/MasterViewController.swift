import  UIKit

class MasterViewController: UITableViewController {

    @IBOutlet var colorControl: UISegmentedControl!
    private var documentFileURLs: [URL] = []
    private var chosenDocument: TinyPixDocument?

    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.add,
            target: self, action: #selector(MasterViewController.insertNewObject))
        navigationItem.rightBarButtonItem = addButton
        let prefs = UserDefaults.standard
        let selectedColorIndex = prefs.integer(forKey: "selectedColorIndex")
        setTintColorForIndex(colorIndex: selectedColorIndex)
        colorControl.selectedSegmentIndex = selectedColorIndex
        reloadFiles()
    }

    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination =
            segue.destination as! UINavigationController
        let detailVC =
            destination.topViewController as! DetailViewController

        if sender === self {
            // if sender === self, a new document has just been created,
            // and chosenDocument is already set.
            detailVC.detailItem = chosenDocument
        } else {
            // Find the chosen document from the tableview
            if let indexPath = tableView.indexPathForSelectedRow {
                let docURL = documentFileURLs[(indexPath as NSIndexPath).row]
                chosenDocument = TinyPixDocument(fileURL: docURL)
                chosenDocument?.open() { success in
                    if success {
                        print("Load OK")
                        detailVC.detailItem = self.chosenDocument
                    } else {
                        print("Failed to load!")
                    }
                }
            }
        }
    }

    func insertNewObject() {
        let alert = UIAlertController(title: "Choose File Name",
                                      message: "Enter a name for your new TinyPix document",
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let createAction = UIAlertAction(title: "Create", style: .default) { action in
            let textField = alert.textFields![0] as UITextField
            self.createFileNamed(fileName: textField.text!)
        };
        alert.addAction(cancelAction)
        alert.addAction(createAction)
        present(alert, animated: true, completion: nil)
    }

    private func createFileNamed(fileName: String) {
        let trimmedFileName = fileName.trimmingCharacters(in: NSCharacterSet.whitespaces)
        if !trimmedFileName.isEmpty {
            let targetName = trimmedFileName + ".tinypix"
            let saveUrl = urlForFileName(fileName: targetName)
            chosenDocument = TinyPixDocument(fileURL: saveUrl)
            chosenDocument?.save(to: saveUrl,for: UIDocumentSaveOperation.forCreating,
                                 completionHandler: { success in
                                    if success {
                                        print("Save OK")
                                        self.reloadFiles()
                                        self.performSegue(withIdentifier: "masterToDetail",
                                                          sender: self)
                                    } else {
                                        print("Failed to save!")
                                    }
        }) }
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentFileURLs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell")
        let fileURL = documentFileURLs[indexPath.row]

        cell?.textLabel!.text = fileURL.deletingPathExtension().lastPathComponent

        return cell!
    }

    @IBAction func chooseColor(sender: UISegmentedControl) {
        let selectedColorIndex = sender.selectedSegmentIndex
        setTintColorForIndex(colorIndex: selectedColorIndex)
        let prefs = UserDefaults.standard
        prefs.set(selectedColorIndex, forKey: "selectedColorIndex")
        prefs.synchronize()
    }

    private func setTintColorForIndex(colorIndex: Int) {
        colorControl.tintColor = TinyPixUtils.getTintColorForIndex(index: colorIndex)
    }

    private func urlForFileName(fileName: String) -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url: URL = URL(fileURLWithPath: "")

        url = urls.first!.appendingPathComponent(fileName)

        return url
    }

    private func reloadFiles() {
        let fm = FileManager.default
        let documentsURL = fm.urls(for:
            .documentDirectory, in: .userDomainMask).first!
        do {
            let fileURLs = try fm.contentsOfDirectory(at: documentsURL,
                                                      includingPropertiesForKeys: nil,
                                                      options: [])
            let sortedFileURLs = fileURLs.sorted(by: { (file1URL, file2URL) -> Bool in
                let attr1 = try! fm.attributesOfItem(atPath: file1URL.path)
                let attr2 = try! fm.attributesOfItem(atPath: file2URL.path)
                let file1Date = attr1[FileAttributeKey.creationDate] as! NSDate
                let file2Date = attr2[FileAttributeKey.creationDate] as! NSDate
                let result = file1Date.compare(file2Date as Date)
                return result == ComparisonResult.orderedAscending
            })
            documentFileURLs = sortedFileURLs
            tableView.reloadData()
        } catch {
            print("Error listing files in directory \(documentsURL.path): \(error)")
        } }


}
