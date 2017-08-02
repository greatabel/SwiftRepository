import UIKit

class MasterViewController: UITableViewController {
    @IBOutlet var colorControl: UISegmentedControl!
    private var documentFileURLs: [URL] = []
    private var chosenDocument: TinyPixDocument?

    private var query: NSMetadataQuery!

    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.add,
            target: self, action: #selector(MasterViewController.insertNewObject))
        navigationItem.rightBarButtonItem = addButton

        let prefs = UserDefaults.standard
        let selectedColorIndex = prefs.integer(forKey: "selectedColorIndex")
        setTintColorForIndex(selectedColorIndex)
        colorControl.selectedSegmentIndex = selectedColorIndex

        reloadFiles()
    }

    private func urlForFileName(_ fileName: String) -> URL {
        //        let urls = FileManager.default.urls(for: .documentDirectory, in: userDomainMask)(
        let urls = FileManager.default.urls(for:
            .documentDirectory, in: .userDomainMask)
        return  urls.first!.appendingPathComponent(fileName)
    }

//    private func reloadFiles() {
//        let fm = FileManager.default
//        let documentsURL = fm.urls(for:
//            .documentDirectory, in: .userDomainMask).first!
//        do {
//            let fileURLs = try fm.contentsOfDirectory(at: documentsURL,
//                                                      includingPropertiesForKeys: nil, options: [])
//            let sortedFileURLs = fileURLs.sorted() { file1URL, file2URL in
//                let attr1 = try! fm.attributesOfItem(atPath: file1URL.path)
//                let attr2 = try! fm.attributesOfItem(atPath: file2URL.path)
//                let file1Date = attr1[FileAttributeKey.creationDate] as! Date
//                let file2Date = attr2[FileAttributeKey.creationDate] as! Date
//                let result = file1Date.compare(file2Date)
//                return result == ComparisonResult.orderedAscending
//            }
//
//            documentFileURLs = sortedFileURLs
//            tableView.reloadData()
//        } catch {
//            print("Error listing files in directory \(documentsURL.path): \(error)")
//        }
//    }
    private func reloadFiles() {
        let fileManager = FileManager.default
        // Passing nil is OK here, matches the first entitlement
//        let cloudURL = fileManager.urlForUbiquityContainerIdentifier(nil)
        let cloudURL = fileManager.url(forUbiquityContainerIdentifier: nil)
        print("Got cloudURL \(String(describing: cloudURL))")
        if (cloudURL != nil) {
            query = NSMetadataQuery()
            query.predicate = NSPredicate(format: "%K like '*.tinypix'",
                                        NSMetadataItemFSNameKey)
            query.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(MasterViewController.updateUbiquitousDocuments(_:)), name: NSNotification.Name.NSMetadataQueryDidFinishGathering,
                                                   object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(MasterViewController.updateUbiquitousDocuments(_:)), name: NSNotification.Name.NSMetadataQueryDidUpdate,
                                                   object: nil)
            query.start()
        }

    }

    func updateUbiquitousDocuments(_ notification: Notification) {
        documentFileURLs = []
        print("updateUbiquitousDocuments, results = \(query.results)")
        let results = query.results.sorted() { obj1, obj2 in
            let item1 = obj1 as! NSMetadataItem
            let item2 = obj2 as! NSMetadataItem
            let item1Date =
                item1.value(forAttribute: NSMetadataItemFSCreationDateKey) as! Date
            let item2Date =
                item2.value(forAttribute: NSMetadataItemFSCreationDateKey) as! Date
            let result = item1Date.compare(item2Date)
            return result == ComparisonResult.orderedAscending
        }
        for item in results as! [NSMetadataItem] {
            let url = item.value(forAttribute: NSMetadataItemURLKey) as! URL
            documentFileURLs.append(url)
        }
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentFileURLs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell")!
        let fileURL = documentFileURLs[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = fileURL.deletingPathExtension().lastPathComponent
        return cell
    }

    @IBAction func chooseColor(_ sender: UISegmentedControl) {
        let selectedColorIndex = sender.selectedSegmentIndex
        setTintColorForIndex(selectedColorIndex)

        let prefs = UserDefaults.standard
        prefs.set(selectedColorIndex, forKey: "selectedColorIndex")
        prefs.synchronize()
    }

    private func setTintColorForIndex(_ colorIndex: Int) {
        colorControl.tintColor = TinyPixUtils.getTintColorForIndex(index: colorIndex)
    }

    func insertNewObject() {
        let alert = UIAlertController(title: "Choose File Name",
                                      message: "Enter a name for your new TinyPix document",
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let createAction = UIAlertAction(title: "Create", style: .default) { action in
            let textField = alert.textFields![0] as UITextField
            self.createFileNamed(textField.text!)
        };

        alert.addAction(cancelAction)
        alert.addAction(createAction)

        present(alert, animated: true, completion: nil)
    }

    private func createFileNamed(_ fileName: String) {
        let trimmedFileName = fileName.trimmingCharacters(
            in: CharacterSet.whitespaces)
        if !trimmedFileName.isEmpty {
            let targetName = trimmedFileName + ".tinypix"
            let saveUrl = urlForFileName(targetName)
            chosenDocument = TinyPixDocument(fileURL: saveUrl)
            chosenDocument?.save(to: saveUrl,
                                 for: UIDocumentSaveOperation.forCreating,
                                 completionHandler: { success in
                                    if success {
                                        print("Save OK")
                                        self.reloadFiles()
                                        self.performSegue(withIdentifier: "masterToDetail", sender: self)
                                    } else {
                                        print("Failed to save!")
                                    }
            })
        }
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        let destination =
            segue.destination as! UINavigationController
        let detailVC =
            destination.topViewController as! DetailViewController

        if sender as AnyObject? === self {
            // if sender === self, a new document has just been created,
            // and chosenDocument is already set.
            detailVC.detailItem = chosenDocument
            print("prepare in masterVC")
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
}

