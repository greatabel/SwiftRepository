//: Playground - noun: a place where people can play

import UIKit

class A {

    class func method() {
        print("hello")
    }
}

let typeA:  A.Type = A.self
typeA.method()


let anyClass: AnyClass = A.self
(anyClass as! A.Type).method()


// ----------------------------
class MusicViewController: UIViewController {

}
class AlbumViewController: UIViewController {

}
let usingVCTypes: [AnyClass] = [MusicViewController.self,
                                AlbumViewController.self]

func setupViewControllers(vcTypes: [AnyClass]) {
    for vcType in vcTypes {
        if vcType is UIViewController.Type {
            let vc = (vcType as! UIViewController.Type).init()
            print(vc)
        }
    }
}

setupViewControllers(vcTypes: usingVCTypes)
