//: Playground - noun: a place where people can play

import UIKit

class ReverseGenerator: IteratorProtocol {
    typealias Element = Int

    var counter: Int
    init<T>(array: [T]) {
        self.counter = array.count - 1
    }

    init(start: Int) {
        self.counter = start
    }

    func next() -> Element? {
        if self.counter < 0 {
            return nil
        } else {
            counter -= 1
            return counter + 1
        }
    }

}

struct ReverseSequence<T>: Sequence {
    typealias Cenerator = ReverseGenerator
    var array: [T]

    init(array: [T]) {
        self.array = array
    }

    func makeIterator() -> Cenerator {
        return ReverseGenerator(array: array)
    }
}

let arr = [0, 10, 2, 3, 40]

for i in ReverseSequence(array: arr) {
    print("Index \(i) is \(arr[i])")
}
