import Foundation

class ItemStore {

    var allItems: [Item] = []

    init() {
        for _ in 0..<5 {
            createItem()
        }
    }

//    Swift 3.0 中方法的返回值必须有接收否则会报警告，当然其实主要目的是为了避免开发人员忘记接收返回值的情况，
//    但是有些情况下确实不需要使用返回值可以使用"_"接收来忽略返回值。当然你也可以增加@discardableResult声明，
//    告诉编译器此方法可以不用接收返回值

    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)

        allItems.append(newItem)

        return newItem
    }

}
