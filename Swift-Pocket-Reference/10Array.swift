var vertext = [Double](count: 3, repeatedValue:1.1)
println(vertext)

var locos:[String] = ["Abel","Abel1"]
let dayPerMonth: [Int] = [28,29,30,31]
let primes = [1,3,5,7,11]

let vowels = ["A", "E", "I", "O", "U"]
let consonants = ["B", "C", "D", "F", "G", "H", "J"] 
var allLetters = vowels + consonants
println(allLetters)

for item in allLetters
{
    println("item= \(item)")
}

for (index,item) in enumerate(allLetters)
{
    println("index= \(index) item= \(item)")
}

//过滤

var names = ["John", "Zoe", "Laura", "albert", "Allen"]
println("origin:  \(names)")
var namesA = names.filter{ count($0) > 4}
println(namesA)

// map

var namesB = names.map { $0.hasPrefix("A") ? $0 : "*" + $0 }
println(namesB)

var namesC = names.reduce("#") { $0 + "@" + $1}
println(namesC)
println(names.reverse())
println(names.sorted{ $0 < $1 })
println(names.sorted{ count($0) < count($1) })

