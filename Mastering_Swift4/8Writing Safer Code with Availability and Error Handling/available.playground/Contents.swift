//: Playground - noun: a place where people can play

import Cocoa

@available(iOS 9.0, *)
func testAvailability2() {
    // Function only for iOS 9 or above
}

@available(iOS 9.0, *)
struct testStruct {

}

func testAvailability1() {
    if #available(iOS 9.0, OSX 10.10, watchOS 2, iOSApplicationExtension 2, *) {
        // Block on available for iOS 9, OSX 10.10, watchOS 2 or above
        print("Minimum requirements met")
    } else {
        //  Block on anything below iOS 9
        print("Minimum requirements not met")
    }
}

