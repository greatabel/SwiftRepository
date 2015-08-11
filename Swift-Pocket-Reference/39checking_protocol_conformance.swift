import Foundation

@objc protocol DemoProto {
    
}

class DemoClass: DemoProto{

}

func protoCheck(t: AnyObject) -> Bool
{
    var flag:Bool = (t is DemoProto)
    println("flag# \(flag)")
    return flag
}

var s = DemoClass()
var a = 4
protoCheck(s)
protoCheck(a)