struct ToDoItem: Equatable {
    
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?

    private let titleKey = "titleKey"
    private let itemDescriptionKey = "itemDescriptionKey"
    private let timestampKey = "timestampKey"
    private let locationKey = "locationKey"

    var plistDict: [String:Any] {
        var dict = [String:Any]()
        dict[titleKey] = title
        if let itemDescription = itemDescription {
            dict[itemDescriptionKey] = itemDescription
        }
        if let timestamp = timestamp {
            dict[timestampKey] = timestamp
        }
        if let location = location {
            let locationDict = location.plistDict
            dict[locationKey] = locationDict
        }
        return dict

    }
    
    init?(dict: [String:Any]) {
        guard let title = dict[titleKey] as? String else
        { return nil }
        self.title = title
        self.itemDescription = dict[itemDescriptionKey] as? String
        self.timestamp = dict[timestampKey] as? Double
        if let locationDict = dict[locationKey] as? [String:Any] {
            self.location = Location(dict: locationDict)
        } else {
            self.location = nil
        }
    }

    
    init(title: String, itemDescription: String? = nil ,
         timestamp: Double? = nil,
         location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }

    static func ==(lbs: ToDoItem, rhs: ToDoItem) -> Bool {
        if lbs.location != rhs.location {
            return false
        }
        if lbs.timestamp != rhs.timestamp {
            return false
        }
        if lbs.title != rhs.title {
            return false
        }
        return true
    }
}
