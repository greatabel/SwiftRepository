struct Queue<T>
{
    var entries = [T]()

    mutating func enqueue(item: T)
    {
        entries.append(item)
    }

    mutating func dequeue() -> T
    {
        return entries.removeAtIndex(0)
    }
}

var q = Queue<Int>()
q.enqueue(11)
q.enqueue(111)
q.enqueue(1111)
q.enqueue(1)

println(q.entries.count)

q.dequeue()

println(q.entries.count)
println(q.entries)

var q1 = Queue<String>()
q1.enqueue("test1")
q1.enqueue("test2")
q1.enqueue("test3")


println(q1.entries.count)

q1.dequeue()

println(q1.entries.count)
println(q1.entries)


struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

println("stack ----------")
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
println(stackOfStrings.items.count)

var stackOfInts = Stack<Int>()
stackOfInts.push(10)
stackOfInts.push(20)
println(stackOfInts.items)