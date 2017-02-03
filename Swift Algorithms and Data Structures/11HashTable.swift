import Foundation

public class HashTable {

    private var buckets: Array<HashNode?>

    init(capacity: Int) {
        self.buckets = Array<HashNode!>(repeating:nil, count: capacity)
    }
    
}
