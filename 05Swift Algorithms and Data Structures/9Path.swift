import Foundation

class Path {

    var total: Int!
    var destination: Vertex
    var previous: Path!

    init() {
        destination = Vertex()
    }
}
