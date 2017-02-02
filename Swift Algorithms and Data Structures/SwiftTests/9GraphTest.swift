import XCTest
@testable import Swift_Algorithms_and_Data_Structures


class SwiftGraphTest: XCTestCase {

    var testGraph: SwiftGraph = SwiftGraph()

    var vertexA: Vertex!
    var vertexB: Vertex!
    var vertexC: Vertex!
    var vertexD: Vertex!
    var vertexE: Vertex!

    override func setUp() {
        super.setUp()

        vertexA = testGraph.addVertex(key: "A")
        vertexB = testGraph.addVertex(key: "B")
        vertexC = testGraph.addVertex(key: "C")
        vertexD = testGraph.addVertex(key: "D")
        vertexE = testGraph.addVertex(key: "E")

        testGraph.addEdge(source: vertexA, neighbor: vertexD, weight: 4)
        testGraph.addEdge(source: vertexA, neighbor: vertexB, weight: 1)
        testGraph.addEdge(source: vertexB, neighbor: vertexD, weight: 5)
        testGraph.addEdge(source: vertexB, neighbor: vertexC, weight: 2)
        testGraph.addEdge(source: vertexD, neighbor: vertexE, weight: 8)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation
        // of each test method in the class.
        super.tearDown()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func neighborTest(source: Vertex, neighbor: Vertex) -> Bool! {
        //add unvisited vertices to the queue
        for e in source.neighbors {
            if (e.neighbor.key == neighbor.key) {
                return true
            }
        }
        XCTFail("vertex \(neighbor.key!) is not a neighbor of vertex \(source.key!)")
        return nil
    }

    func testVertexNeighbors() {
        neighborTest(source: vertexA, neighbor: vertexD)
        neighborTest(source: vertexA, neighbor: vertexB)
        neighborTest(source: vertexB, neighbor: vertexD)
        neighborTest(source: vertexB, neighbor: vertexC)
        neighborTest(source: vertexD, neighbor: vertexE)
    }
    
}
