protocol Queueable {
    
    typealias  NativeType 
    mutating func enqueue(item: NativeType)
    mutating func dequeue() -> NativeType
}

struct  StringList: Queueable {
    
    var list = [String]()

    typealias  NativeType = String

    mutating func enqueue(item: NativeType){
        list.append(item)
    }

    mutating func dequeue() -> NativeType
    {
        return list.removeAtIndex(0)
    }

}

var  s = StringList()
s.enqueue("Abel")
s.enqueue("Abel1")
s.enqueue("Abel2")
s.dequeue()

print(s.list)