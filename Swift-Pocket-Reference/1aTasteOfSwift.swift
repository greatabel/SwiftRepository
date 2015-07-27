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

extension Int {
    func times(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
  }
5.times{
    println("Hello,World!")
}