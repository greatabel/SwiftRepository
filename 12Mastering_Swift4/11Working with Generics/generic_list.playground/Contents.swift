//: Playground - noun: a place where people can play

import Cocoa

class List<T> {
    var items = [T]()

    func add(item: T) {
        items.append(item)
    }

    func getItem(index: Int) -> T? {
        if items.count > index {
            return items[index]
        } else {
            return nil
        }
    }

}

var list = List<String>()
list.add(item: "Hello")
list.add(item: "World")
print(list.getItem(index: 1)!)

var listA = List<Int>()
listA.add(item: 10)
listA.add(item: 20)
print(listA.getItem(index: 1)!)
