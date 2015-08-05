//  http://swifter.tips/init-keywords/

class ClassA{
    let numA: Int

   required init(num: Int){
        numA = num
    }


    convenience init(bigNum: Bool){
        self.init(num: bigNum ? 1000:1)
    }

}

class ClassB: ClassA {
    let numB: Int

    required init(num: Int){
        numB = num + 1
        super.init(num:num)
    }
    
}

let anObj = ClassB(bigNum:true)
println("\(anObj.numA) \(anObj.numB)")