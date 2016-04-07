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
    
}
