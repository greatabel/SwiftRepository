import UIKit

class SerialQueues: NSObject {

     func example() {
        let calculation = DoCalculations()

        let squeue = DispatchQueue(label: "test")
        let s = {calculation.performCalculation(100000, tag: "sync1")}
        squeue.async (execute: s)
        squeue.async {
            calculation.performCalculation(1000, tag: "sync2")
        }
        squeue.async {
            calculation.performCalculation(100000, tag: "sync3")
        }

    }
}
