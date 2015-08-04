println("Matching ranges in a case clause")

var marbles = 600 
switch marbles
{
case 0:
    println("you've lost your marbles!")
case 1:
    println("I see you have a marble")
case 2...5:
    println("I see you have some marbles")
case 6...10:
    println("That's quite a handful of marbles!")
case 10...99:
    println("That's lots and lots of marbles")
default:
    println("Were marbles on sale?")
}

println("Using tuples in a case clause")

let year = 9 // 7-10
let gender: Character = "M" // "M" or "F"
let weekday = "Fri" // "Mon" through "Fri"
let record = (gender, year, weekday)
print("record = \(record)")
switch record {
case ("M", 7...8, "Mon"): 
    println ("Sports: Cricket")
case ("F", 7...8, "Mon"): 
    println ("Sports: Netball")
case ("M", 9...10, "Tue"): 
    println ("Sports: Football")
case ("F", 9...10, "Tue"): 
    println ("Sports: Softball")
case (_, 7...8, "Wed"): 
    println ("Music")
case (_, 9...10, "Wed"): 
    println ("Theater")
case (_, 7...10, "Thu"): 
    println ("Sciences") 
case (_, 7...10, "Fri"):
    println ("Humanities")
default:
    println("nothing scheduled or invalid input")
}


println("Value binding with tuples and ranges")


func testSwitch(record: (String, Int, String)) -> ()
{
    println("--- ### ---")
    switch record {
    case (_, let yr, "Fri"):
        println(" Sciences - customized for year \(yr) ")
    // the where qualifier
    case (_, 3 ,let day) where day.hasPrefix("T"):
        println("has T")
    default:
        println("here")
        
    }

}
testSwitch(("M",9,"Fri"))
testSwitch(("M",3,"Thu"))
