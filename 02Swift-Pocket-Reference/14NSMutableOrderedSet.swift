import Foundation
let orderedSet = NSOrderedSet(array: [1,20,300])
for elem in orderedSet {
    println("#:\(elem)")
}

//方法2
var set = NSMutableOrderedSet()
set.addObject("foo");
set.addObject("bar");
set.addObjectsFromArray(["bar", "wee", "foo"])

for i in 0..<set.count {
    println(set.objectAtIndex(i))
}