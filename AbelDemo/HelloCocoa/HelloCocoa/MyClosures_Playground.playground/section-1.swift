// Playground - noun: a place where people can play

// default sort function
var sortingInline = [2, 5, 98, 2, 13]
sort(&sortingInline)sortingInline


var numbers = [2,1,56,32,120,13]
numbers
var numberSorted = sorted(numbers,{(n1:Int, n2: Int) -> Bool in
    return n2 > n1
})
numberSorted

var numbersSortedReverse = sorted(numbers , {n1,n2 in return n1 > n2})
numbersSortedReverse



var numberSortedAgain = sorted(numbers){ $0 > $1 }

var comparator = {(a: Int, b:Int) in a < b}
comparator(1,10)



