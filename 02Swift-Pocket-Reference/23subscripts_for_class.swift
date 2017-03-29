var m = [Int](count:10, repeatedValue:0) 
m[1] = 45;
m[2]=m[1]*2
var cpus = ["BBC Model B":"6502", "Lisa":"68000", "TRS-80":"Z80"]
let cpu = cpus["BBC Model B"]
println("\(m[2]) # \(cpu!) ")
println("\(m[2]) # \(cpu) ")

println("Class can have subscript too.")

class Byte{
    var d: UInt8 = 0

    subscript(whichBit: UInt8) -> UInt8 {

        get { return (d >> whichBit) & 1 }

        set {
            let mask = 0xFF ^ (1 << whichBit)
            let bit = newValue << whichBit
            d = d & mask | bit
            println("d= \(d)")
        }
        
    }
}

var b = Byte()
b[0]=1
// b is now 0000 0001, or 1 
b[2]=1
// b is now 0000 0101, or 5 
b[0]=0

// http://www.tutorialspoint.com/swift/swift_subscripts.htm

struct subexample{
    let decrementer: Int
    subscript(index: Int) -> Int {
        return decrementer / index
    }
}

let division = subexample(decrementer:100)
println("The number is divisible by \(division[9]) times")
println("The number is divisible by \(division[2]) times")
println("The number is divisible by \(division[3]) times")
println("The number is divisible by \(division[5]) times")
println("The number is divisible by \(division[7]) times")

class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
}
var p = daysofaweek()

println(p[0])
println(p[1])
println(p[2])
println(p[3])


struct Matrix {
    let rows: Int, columns: Int
    var print: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        print = Array(count: rows * columns, repeatedValue: 0.0)
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            return print[(row * columns) + column]
        }
        set {
            print[(row * columns) + column] = newValue
        }
    }
}
var mat = Matrix(rows: 3, columns: 3)

mat[0,0] = 1.0
mat[0,1] = 2.0
mat[1,0] = 3.0
mat[1,1] = 5.0

println("\(mat[0,0])")
println("\(mat[0,1])")
println("\(mat[1,0])")
println("\(mat[1,1])")