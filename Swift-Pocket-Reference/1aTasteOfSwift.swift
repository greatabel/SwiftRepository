extension  String {
    func leadingSpaces(width: Int) -> String {
    var s = "\(self)"
    for i in count(s)..<width {
        s = " " + s
        }
    return s

    }


}

var strTest = "hello world"
println(strTest)
println(strTest.leadingSpaces(20))