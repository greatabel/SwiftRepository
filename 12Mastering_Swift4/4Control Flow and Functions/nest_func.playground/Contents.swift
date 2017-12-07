//: Playground - noun: a place where people can play

import Cocoa

func isValidIP(ipAddr: String?) -> Bool {

    guard let ipAddr = ipAddr else {
        return false
    }
    let octets = ipAddr.split { $0 == "."}.map{String($0)}
    guard octets.count == 4 else {
        return false
    }
    func validOctet(octet: String) -> Bool {
        guard let num = Int(String(octet)), num >= 0 && num < 256 else {
            return false
        }
        return true
    }
    for octet in octets {
        guard validOctet(octet: octet) else {
            return false
        }
    }
    return true
}

isValidIP(ipAddr: "10.1.1")

