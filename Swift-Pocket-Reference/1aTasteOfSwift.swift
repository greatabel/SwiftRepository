extension  String {
    func leadingSpaces(width: Int) -> String {
    var s = "\(self)"
    for i in count(s)..<width {
        s = " " + s
        }
    return s

    }

    func trailingSpaces(width: Int) -> String{

        var s = "\(self)"
        for i in count(s)..<width
        {
            s = s + " "
        }
        return s
    }


}

var strTest = "hello world"
println(strTest)
println(strTest.leadingSpaces(20))
var trailStr = strTest.trailingSpaces(20) + "@"
println(trailStr)

//数组
var users = ["abel0","abel1","abel2","abel4"]
var ages = [10,20,30,40]
//字典
var merged = [String: Int]()
var totalAge = 0.0;

//merge 2 arrays into dictionary
for var i=0; i < ages.count; i++
{
    merged[users[i]] = ages[i]
}

for user in sorted(merged.keys)
{
    let age = merged[user]!

    totalAge += Double(age)
    let paddedUser = user.trailingSpaces(10)
    let paddedAge = "\(age)".leadingSpaces(3)
    println("\(paddedUser)\(paddedAge)")
}
println("\n(merged.count) users")
println("average age:\(totalAge / Double(merged.count))")

// http://stackoverflow.com/questions/28469248/how-to-print-multiple-instances-of-a-variable-in-swift
func * (left: String, right: Int) -> String {

    return join("", Repeat(count:right, repeatedValue: left))

}


println(" ^-^ " * 10)


extension Int {
    func times(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
  }
5.times{
    println("#Hello,World!")
}