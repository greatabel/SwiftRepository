let names = ["John", "Zoe", "Laura", "albert", "Allen"]
let s = sorted(names)
println("orgin:\(names) #after sorted:\(s)")

let t = sorted(names, {
    (s1: String, s2: String) -> Bool  in
        return s1 < s2 
    })
println("orgin:\(names) #after sorted:\(t)")

let t_1 = sorted(names, {s1, s2 in return s1 > s2})
println("orgin:\(names) #after sorted:\(t_1)")

let t_2 = sorted(names, {s1, s2 in s1 < s2})
println("orgin:\(names) #after sorted:\(t_2)")

let v = sorted(names, {s1, s2 in count(s1) < count(s2)})
println("orgin:\(names) #after sorted(count):\(v)")

println("--- Automatic Argument Names ---")
let t = sorted(names, { $0<$1 } ) 
let u = sorted(names, { $1<$0 } ) 
let v = sorted(names,
{ count($0)<count($1) } )



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

// －－－－－－－－－closure 例子：－－－－－－－－－－－－－－

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