import UIKit

func appendQuery(url: String,
                        key: String,
                        value: AnyObject) -> String {

    func appendQueryDictionary(url: String,
                                   key: String,
                                   value: [String: AnyObject]) -> String {
        //...
        let result = ""
        return result
    }

    func appendQueryArray(url: String,
                              key: String,
                              value: [AnyObject]) -> String {
        //...
        let result = ""
        return result
    }

    func appendQuerySingle(url: String,
                               key: String,
                               value: AnyObject) -> String {
        //...
        let result = ""
        return result
    }

    if let dictionary = value as? [String: AnyObject] {
        return appendQueryDictionary(url: url, key: key, value:dictionary)
    } else if let array = value as? [AnyObject] {
        return appendQueryArray(url: url, key:key, value:array)
    } else {
        return appendQuerySingle(url:url, key:key, value:value)
    }
}
