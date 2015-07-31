func someFunc(inout i: Int) -> Int {
    i = i + 1
    return i
}

var i: Int = 10
println("\(i) # \(someFunc(&i))")


// return optional value

func division(dividend: Double, divisor: Double) -> Double?
{
    if(divisor == 0)
    {
        return nil
    }
    return dividend / divisor
}

var d = division(9.0, 0.0)
if d != nil
{
    println(d!)
}else{
    println("invalid value!!")
}

//return multiple values
func getRange(input: Int) -> (lower: Int, upper: Int)?
{
    if(input == 0){
        return nil
    }
    return (10,20)
}
println(getRange(1))

let limits = getRange(1)
if limits != nil 
{
    for i in limits!.lower...limits!.upper {
    println("i=\(i)")
    }
}

println("Local and External Parameter Names\n")
func f(p1: Int) -> String 
{
return "\(p1) is here"
}
println(f(10) )

func funcName(stringExternal s1: String, forStringExternal s2: String = "I am default value") -> Int {
    println("\(s1) # \(s2)")
    return 100
}
funcName(stringExternal:"test1", forStringExternal: "test2")
funcName(stringExternal:"test3")

println("可变参数长度")

func sum(args: Int...) -> Int 
{
    var result = 0
    for a in args
    {
        result += a
    }
    return result
}
println("sum(1,2,3,4,5)= \(sum(1,2,3,4,5))")





