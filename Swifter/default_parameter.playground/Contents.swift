//: Playground - noun: a place where people can play

import UIKit

func sayHello1(str1: String = "Hello", str2: String, str3: String) {
    print(str1 + str2 + str3)
}

sayHello1(str1: "Hi", str2:" # ", str3: " @ ")
sayHello1(str2:" # ", str3: " @ ")

func sayHello2(str1: String, str2: String, str3: String = "World") {
    print(str1 + str2 + str3)
}
sayHello2(str1: "Hello", str2: " Test ")
sayHello2(str1: "Hello", str2: " # ", str3: "Here" )
