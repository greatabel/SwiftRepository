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