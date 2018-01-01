//: Playground - noun: a place where people can play
import UIKit

class Person<T> {
    var items = [T]()

    func push(item:T){
        items.append(item)
    }

    func pop()->T{
        return items.removeLast()
    }

    subscript(i:Int)->T{
        get{
            return items[i]
        }
        set{
            items[i]=newValue
        }
    }

}

var pList = Person<String>()
pList.push(item: "Abel0")
pList.push(item: "Abel1")
print(pList[1])

typealias WorkerId = Float
typealias Worker = Person<WorkerId>

var workerList = Worker()
workerList.push(item: 10.1)
workerList.push(item: 20.2)
print(workerList[1])
