import UIKit

class ConcurrentQueues: NSObject {

    func example() {
        let calculation = DoCalculations()

        let cqueue = DispatchQueue(label: "test", attributes: .concurrent)

        let c = {calculation.performCalculation(10000, tag: "async1")}
        cqueue.async(execute: c)

        cqueue.async {
            calculation.performCalculation(1000, tag: "async2")
        }
        cqueue.async {
            calculation.performCalculation(10000, tag: "async3")
        }

    }
}
