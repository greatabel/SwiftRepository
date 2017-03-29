
let names = ["John", "Zoe", "Laura", "albert", "Allen"] 
let s = sorted(names)
println("\(names) # \(s)")

/*
http://letsswift.com/2014/06/closures/
*/

func backwards(s1: String, s2: String) -> Bool {
return s1 > s2
}
var reversed = sorted(names, backwards)
println("reversed= \(reversed)")

var reversedA = sorted(names,{
    (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
println("reversedA= \(reversedA)")

var reversedB = sorted(names,{s1, s2 in return s1 > s2 })
println("reversedB= \(reversedB)")

var reversedC = sorted(names, { $0 > $1 })
println("reversedC= \(reversedC)")

rut
