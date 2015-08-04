println("    for initialization; condition; increment { \n" +
"statements\n" +
"}")

for var i=0; i<10; i++
{
    println("\(i)")
}

println(" for index in collection\n" +
    "{\n" +
    "statements\n" +
    "}")

for i in 3...8
{
    println("i= \(i)")
}

var microprocessors = ["test0","test1","test2"]
for i in microprocessors
{
    println(i)
}

var vehicles = ["bike":2, "trike":3, "car":4, "lorry":18]
for (vehicle, wheels) in vehicles
{
    println("\(vehicle) # \(wheels)")
}

println("while condition\n" +
    "{\n" +
    "statements\n" +
    "}")

var count = 5
while(count < 10){
    println(count)
    count++
}

var t = 0
do {
    println("t=\(t)")
    t++
}while( t < 3)


var isAI: Bool!
isAI = true

if(isAI == true){

    println("Y")
    }else{
    println("N")
    }



func testSwitch(s0: String) -> ()
{
    println("--- ### ---")
    switch s0
    {
        case "a", "e", "i", "o", "u": 
            println("this letter is a vowel")
        case "b", "d", "g", "k", "p", "t":
            println("this letter may be a plosive sound in "
        + "English") 
            fallthrough
        case "c", "f", "h", "j", "l", "v", "w", "x", "y", "z": 
            println("this letter is a consonant") 

        default: 
            println("this letter doesn't interest me")
    }

}

var a = "c"
testSwitch(a)
a = "b"
testSwitch(a)


var testVal = "hello"
var result = 0

switch(testVal) {
case "one", "two":
    result = 1
default:
    result = 3
}
println("result: \(result)")

var testVar = "hello"

println("等价于：")

switch(testVar) {
case "one":
    fallthrough
case "two":
    result = 1
default:
    result = 3
}
println("result: \(result)")




