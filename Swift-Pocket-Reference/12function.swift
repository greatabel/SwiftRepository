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

let limits = getRange(1)!
if limits!=nil{
    for i in limits.lower...limits.upper {
    println("i=\(i)")
    }
}
