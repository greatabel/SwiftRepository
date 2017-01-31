import Foundation


public class SwiftGraph {

    private var canvas: Array<Vertex>
    public var isDirected: Bool

    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }

    func addVertex(key: String) -> Vertex {

        let childVertex: Vertex = Vertex()
        childVertex.key = key

        canvas.append(childVertex)
        return childVertex
    }

    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        let newEdge = Edge()

        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        print("The neighbor of vertex: \(source.key as String!) is \(neighbor.key as String!)..")

        if( isDirected == false ) {

            let reverseEdge = Edge()

            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
            print("The neighbor of vertex: \(neighbor.key as String!) is \(source.key as String!)")
        }
    }

    

}
