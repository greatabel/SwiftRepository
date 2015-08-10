// http://southpeak.github.io/blog/2014/07/02/ios-swift-protocol/
protocol RandomNumberGenerator {
    func random() -> Double
}


class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()

println(generator.random()    )

println("------组合------")

protocol P1 {
    var variable1 : String { get }
}

protocol P2 {
    var variable2 : Int { get }
}

struct MyStruct : P1, P2 {
    var variable1: String
    var variable2: Int
}

func funcWithProtocols(protocols: protocol<P1, P2>) {
 println("\(protocols.variable1) # \(protocols.variable2)")
}

let st = MyStruct(variable1: "v", variable2: 2)

funcWithProtocols(st)
