import Foundation

public class Context {

    static let defaultContext = Context()

    var paybacks = [Payback]()

    func addPayback(payback: Payback) {
        paybacks.insert(payback, atIndex: 0)
    }

    func editPayback(index: Int, firstName: String, lastName: String, amount: Double, updated: NSDate) {
        let payback = paybacks[index]
        payback.firstName = firstName
        payback.lastName = lastName
        payback.amount = amount
        payback.updatedAt = updated
    }

    func removePayback(index: Int) {
        paybacks.removeAtIndex(index)
    }

}