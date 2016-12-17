import XCTest


@testable import Swift_Algorithms_and_Data_Structures

class SortingTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func my_validate_whether_in_order(_ resultList: Array<Int>) {

//        for (x = 0; x < resultList.count; x++) {
        for x in 0..<resultList.count {
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
            XCTFail("numberlist items not in sorted order..")
            }
            else {
            print("item \(resultList[x]) is sorted..")
            }
        }
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testInsertSort() {
        let sorting = Sorting()
        print(sorting.insertionSort([1,3,2,4]))
    }

    func testBubbleSort() {
        let sorting = Sorting()
        print(sorting.bubbleSort([1,3,4,2]))
    }

    func testSelectSort(){
        let sorting = Sorting()
        print(sorting.selectSort([1,4,3,2]))
    }

    func testQuickSort() {
        let sorting = Sorting()
        print("testQuickSort-------")
        let results = sorting.quickSort([1,4,3,2])
        print(results)
        my_validate_whether_in_order(results)
    }
    
}
