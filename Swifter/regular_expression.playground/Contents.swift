//: Playground - noun: a place where people can play

import UIKit

struct RegexHelper {

    let regex: NSRegularExpression

    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern,
                                        options: .caseInsensitive)
    }

    func match(input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.count))
        return matches.count > 0
    }
}


let mailPattern =
"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

let matcher: RegexHelper
do {
    matcher = try RegexHelper(mailPattern)
}

let maybeMailAddress = "onev@onevcat.com"

if matcher.match(input: maybeMailAddress) {
    print("有效的邮箱地址")
}

// ------------------------------------
//infix operator =~ {
//    associativity none
//    precedence 130
//}
//
//func =~(lhs: String, rhs: String) -> Bool {
//    do {
//        return try RegexHelper(rhs).match(input: lhs)
//    } catch _ {
//        return false
//    }
//}

