#!/usr/bin/env xcrun swift

// swift test2.swift test it
//可用 terminal 直接 swift test2.swift 调用
import Foundation


println(Process.arguments )

var c = 0;
for arg in Process.arguments {
    println("argument \(c) is: \(arg)")
    c++
}
