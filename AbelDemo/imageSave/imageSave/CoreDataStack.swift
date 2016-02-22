import CoreData

class CoreDataStack {

    let context: NSManagedObjectContext
    let psc: NSPersistentStoreCoordinator
    let model: NSManagedObjectModel
    let store: NSPersistentStore?
    var fullRes = [FullRes]()
    static let sharedInstance = CoreDataStack()

    init() {
        let bundle = NSBundle.mainBundle()
        let modelURL =
        bundle.URLForResource("SimpleCam", withExtension: "momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)!
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = psc
        let documentsURL =  CoreDataStack.applicationDocumentsDirectory()
        let storeURL = documentsURL.URLByAppendingPathComponent("SimpleCam")
        let options =  [NSMigratePersistentStoresAutomaticallyOption: true]
        do {
            try store = psc.addPersistentStoreWithType(NSSQLiteStoreType,
                configuration: nil, URL: storeURL, options: options)
        } catch let unknownError {
            print("\(unknownError) is an unknown error.")
            store = nil
        }
    }

    func saveContext() {
        do {
            if context.hasChanges {
                try context.save()
            }
        } catch let unknownError {
            print("\(unknownError) is an unknown error.")
        }
    }

    func loadData() {
        print("in SharingManager init()")
        let userFetch = NSFetchRequest(entityName: "FullRes")
        do {
            if let fetchedResults =
                try context.executeFetchRequest(userFetch) as? [FullRes] {

                    fullRes = fetchedResults
            }
        } catch let unknownError {
            print("no user error \n \(unknownError)")
        }
    }

    class func applicationDocumentsDirectory() -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory,
            inDomains: .UserDomainMask)
        return urls[0]
    }
}
