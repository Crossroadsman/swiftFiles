// Creates a custom Graph type, an instance of which contains vertices (type: Vertex) and edges (type: Edge).
// a vertex has a set of edges
// an edge has a set of vertices and, optionally, a weight

func ==(lhs: Graph, rhs: Graph) -> Bool {
    return lhs.id == rhs.id
}

func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.id == rhs.id
}

func ==(lhs: Edge, rhs: Edge) -> Bool {
    return lhs.id == rhs.id
}


struct Graph : Hashable {
    
    static var idList: Int = []
    
    let id: Int
    var vertices: Set = []
    var edges: Set = []
    
    var hashValue: Int {
        return self.id
    }
    
    
    init() {
        if idList.isEmpty {
            id = 0
            idList.append(id)
        } else {
            // TODO: check syntax for getting last entry in array
            id = idList.last + 1
            idList.append(id)
        }
    }
    
    
}

class Vertex : Hashable {
    
    static var idList: Int = []
    
    let id: Int
    var edges: Set = []
    
    var hashValue: Int {
        return self.id
    }
    
    init() {
        if idList.isEmpty {
            id = 0
            idList.append(id)
        } else {
            // TODO: check syntax for getting last entry in array
            id = idList.last + 1
            idList.append(id)
        }
    }
    
    func addEdge(e: Edge) {
        // TODO: make the addEdge method put the edge into this vertex's set (and the corresponding vertex's set), and put this vertex into e's set (creating the edge if necessary?)
    
    }
    
}

class Edge : Hashable {
    
    static var idList: Int = []
    
    let id: Int
    var nodes: Set []
    var weight: Int?
    
    var hashValue: Int {
        return self.id
    }
    
    init() {
        if idList.isEmpty {
            id = 0
            idList.append(id)
        } else {
            // TODO: check syntax for getting last entry in array
            id = idList.last + 1
            idList.append(id)
        }
    }
    
    func addNodes(a: Vertex, _ b: Vertex) {
        // TODO: make the addEdge method put the vertices into this Edge's set, and put this edge into a's and b's sets (creating the vertex if necessary?)
    
    }
    
}
