import Foundation

public class HashTable {

    private var buckets: Array<HashNode?>

    init(capacity: Int) {
        self.buckets = Array<HashNode!>(repeating:nil, count: capacity)
    }

    func addWord(firstname: String, lastname: String) {
        var hashindex: Int!
        var fullname: String!

        fullname = firstname + lastname
        hashindex = self.createHash(fullname)
        let childToUse: HashNode = HashNode()
        var head: HashNode!

        childToUse.firstname = firstname
        childToUse.lastname = lastname

        if  buckets[hashindex] == nil {
            buckets[hashindex] = childToUse
        }
        else {
            print("a collision occured. implementing chaining..")
            head = buckets[hashindex]

            //append new item to the head of the list
            childToUse.next = head
            head = childToUse

            //update the chained list
            buckets[hashindex] = head
        }

    }

    func findWord(firstname: String, lastname: String) -> Bool! {
        var hashindex: Int!
        var fullname: String!
        fullname = firstname + lastname
        hashindex = self.createHash(fullname)

        if buckets[hashindex] == nil {
            print("name not found in hash table..")
            return false
        }
        else {
            var current: HashNode! = buckets[hashindex]
            while(current != nil){
                let hashName: String! = current.firstname + current.lastname
                if (hashName == fullname) {
                    print("\(current.firstname) \(current.lastname) found in hash table..")
                    return true
                }
                print("searching for word through chained list..")
                current = current.next
            }

        }
        return false
    }

    func createHash(_ fullname: String) -> Int! {
        var remainder: Int = 0
        var divisor: Int = 0
        for key in fullname.unicodeScalars {
            divisor += Int(key.value)
        }
        remainder = divisor % buckets.count
        return remainder - 1
    }
}
