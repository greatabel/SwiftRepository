import UIKit

class OperationWithBlockTest: NSObject {
    
    func example() {
        let operationQueue = OperationQueue()
        //operationQueue.maxConcurrentOperationCount = 1
        let calculation = DoCalculations()
        
        operationQueue.addOperation() {
            calculation.performCalculation(10000000, tag: "Operation1")
        }
        
        operationQueue.addOperation() {
            calculation.performCalculation(10000, tag: "Operation2")
        }
        
        operationQueue.addOperation() {
            calculation.performCalculation(1000000, tag: "Operation3")
        }
    }
   
}
