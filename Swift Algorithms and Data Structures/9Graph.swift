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

    func reversePath( head: Path!, source: Vertex) -> Path! {
        var head = head
        if head == nil {
            return nil
        }
        var current: Path! = head
        var prev: Path!
        var next: Path!
        while(current != nil) {
            next = current.previous
            current.previous = prev
            prev = current
            current = next
        }
        //append the source path to the sequence
        let sourcePath: Path = Path()
        sourcePath.destination = source
        sourcePath.previous = prev
        sourcePath.total = nil

        head = sourcePath
        return head

    }

    //process Dijkstra's shortest path algorthim
    func processDijkstra(source: Vertex, destination: Vertex) -> Path? {


        var frontier: Array<Path> = Array<Path>()
        var finalPaths: Array<Path> = Array<Path>()


        //use source edges to create the frontier
        for e in source.neighbors {

            let newPath: Path = Path()
            newPath.destination = e.neighbor
            newPath.previous = nil
            newPath.total = e.weight
            //add the new path to the frontier
            frontier.append(newPath)
        }
        //construct the best path
        var bestPath: Path = Path()
        while frontier.count != 0 {

            //support path changes using the greedy approach
            bestPath = Path()
            var pathIndex: Int = 0
            for x in 0..<frontier.count {

                let itemPath: Path = frontier[x]

                if  (bestPath.total == nil) || (itemPath.total < bestPath.total) {
                    bestPath = itemPath
                    pathIndex = x
                }

            }
            //enumerate the bestPath edges
            for e in bestPath.destination.neighbors {

                let newPath: Path = Path()

                newPath.destination = e.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weight
                //add the new path to the frontier
                frontier.append(newPath)
            }
            //preserve the bestPath
            finalPaths.append(bestPath)
            //remove the bestPath from the frontier
            frontier.remove(at: pathIndex)
        } //end while



        //establish the shortest path as an optional
        var shortestPath: Path! = Path()


        for itemPath in finalPaths {

            if (itemPath.destination.key == destination.key) {

                if  (shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
                    shortestPath = itemPath
                }

            }

        }
        return shortestPath
    }

    ///an optimized version of Dijkstra's shortest path algorthim
    func processDijkstraWithHeap(source: Vertex, destination: Vertex) -> Path! {
        let frontier: PathHeap = PathHeap()
        let finalPaths: PathHeap = PathHeap()
        //use source edges to create the frontier
        for e in source.neighbors {
            let newPath: Path = Path()
            newPath.destination = e.neighbor
            newPath.previous = nil
            newPath.total = e.weight
            //add the new path to the frontier
            frontier.enQueue(key: newPath)
        }
        //construct the best path
        var bestPath: Path = Path()
        while frontier.count != 0 {
            //use the greedy approach to obtain the best path
            bestPath = Path()
            bestPath = frontier.peek()
            //enumerate the bestPath edges
            for e in bestPath.destination.neighbors {
                let newPath: Path = Path()
                newPath.destination = e.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weight
                //add the new path to the frontier
                frontier.enQueue(key: newPath)
            }
            //preserve the bestPaths that match destination
            if (bestPath.destination.key == destination.key) {
                finalPaths.enQueue(key: bestPath)
            }
            //remove the bestPath from the frontier
            frontier.deQueue()
        } //end while



        //obtain the shortest path from the heap
        var shortestPath: Path! = Path()
        shortestPath = finalPaths.peek()


        return shortestPath

    }



}
