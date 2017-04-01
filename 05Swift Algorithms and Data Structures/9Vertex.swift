import Foundation


public class Vertex{

    var key: String?
    var neighbors: Array<Edge>
    var visited: Bool = false

    init() {
        self.neighbors = Array<Edge>()
    }
}
