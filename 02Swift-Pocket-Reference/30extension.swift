import Foundation

extension String
{
    var hashtag: String
    {
        get
        {
            return "#\(self)"
        }
        set
        {
            let stringWithoutHashtag = newValue.stringByReplacingOccurrencesOfString("#", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            self = stringWithoutHashtag
        }
    }
}
 
//Usage
let StringOne = "swift"
let StringTwo = "swiftlang".hashtag  //Can use on literals too
 
println(StringOne.hashtag)  //Outputs:  "#swift"
println(StringTwo)  //Outputs:  "#swiftlang"
 
var justTag = String()
 
justTag.hashtag = "#iosdev"
println(justTag)  //Outputs:  "iosdev"

// http://www.littlelines.com/blog/2014/06/06/2014-swift-extensions/
extension Int {
    func times(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
  }

5.times {
    println("Hello, World!")
  }


extension Array {
    var first: T { return self[0] }
    var second: T { return self[1] }
    var forty_two: T { return self[42] }
    var last: T { var last = self.count - 1; return self[last] }
  }
var things = [1, 2, 3, 4, 5]
println("\(things.first) # \(things.second) ## \(things.last) ### ")