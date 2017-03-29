var s:String = "s"
var s0:String!
var s1:String! = "s1"
var ss0:String?
var ss1:String? = "ss1"

println(" s0, s1 ,ss0, ss1 是可以为空值 \n， s0,s1 预设不为空值 \n",
   " ss0, ss1 预设为空值")

// http://stackoverflow.com/questions/24233012/splitting-up-swift-code-in-multiple-lines-for-better-readability
println("test1 " +
    "test2 " +
    "test3")


var strValue: String?
if strValue != nil {
    //do sth with strValue
    println("Not nil")
}else{
    println("empty")
}

strValue = "test"

if strValue != nil {
    let hashValue = strValue?.hashValue
    //do sth with strValue
    println("Not empty \(strValue) # \(hashValue)")
}else{
    println("empty")
}

let hashValue_1 = strValue!.hashValue
print("加!后直接调用也是可以的：\(hashValue_1) ＃ \(strValue!) \n")

println("--- Unwrapping Optionals ---")
if strValue != nil
{
    let r = strValue!
    println("r= \(r)")
}
else
{
    println("empty")

}

// strValue = nil
println("--- Implicitly Unwrapped Optionals ---")
let strValue_direct: String
// 直接赋值给 optional 是不行的。
// strValue_direct = strValue
let strValue_implicitly = strValue!

// strValue = nil
println("--- Optional Binding ---")
if let somStr = strValue
{
    println("\(somStr)")
}else{
    println("empty")
}




