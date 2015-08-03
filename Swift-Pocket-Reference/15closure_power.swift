//  http://jimmydeveloper.blogspot.com/2014/12/closure.html
func greeting(s0: String) -> (String)
{
    return "Hello \(s0) !!!"
}

var returnMsg = greeting("test")
println("Case 1:\(returnMsg)")

var funVar  = greeting
var returnMsgA = greeting("testa")
println("Case 2:\(returnMsgA)")

func useFuncAsParam(string: String, funcAsParam: (String) -> (String)) -> (String)
{
    return funcAsParam(string)
}
var returnMsgB = useFuncAsParam("testb", greeting)
println("Case 3:\(returnMsgB)")

var returnMsgClosure = useFuncAsParam("testclosure", {
     (s0: String) -> (String) in 
        return "Hello \(s0) "
    })
println("Case 4:\(returnMsgClosure)")

var returnMsgClosureA = useFuncAsParam("testclosurea", {
    s0 in 
        return "Hello \(s0) aa!"
    })
println("Case 5:\(returnMsgClosureA)")

var returnMsgClosureB = useFuncAsParam("testclosureb"){
    return "Hello \($0) bb!"
}
println("Case 6:\(returnMsgClosureB)")


let brands = ["Apple", "Facebook", "Google", "Microsoft", "Amazon"]
println("Orgin----> \(brands)")

var sortedBrands = brands.sorted({
    (s0:String, s1: String) -> Bool in 
        return s0 < s1
    })
println("Case 8:\(sortedBrands)")
var sortedBrandsA = brands.sorted{$0 < $1}
println("Case 9:\(sortedBrandsA)")

let mappingDict = ["XD":"笑到超開心", "Bj4":"不解釋", "Orz":"很冏", "魯蛇":"loser", "灑花":"很開心"]
let networkTerms = ["XD", "Orz", "Bj4"]
let transTerms = networkTerms.map{
    (var term) -> String in
    var each = mappingDict[term]
    if let output = each {
        return output
    }else {
        return "input error!"
    }
}
println("CASE 11: \(transTerms)")

let squareArray = [1, 2, 3].map{ $0 * $0 }
println("CASE 12: \(squareArray)")