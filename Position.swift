import Foundation

struct Position {
    
    private enum Constants {
        static let min_x = 0
        static let max_x = 7
        
        static let min_y = 0
        static let max_y = 7
        
        static let min_z = 0
        static let max_z = 0
    }
    
    private var x: Int
    private var y: Int
    private var z: Int
    
    init?(x: Int, y: Int, z: Int = 0) {
        
        guard x >= min_x && x <= max_x &&
              y >= min_y && y <= max_y &&
            z >= min_z && z <= max_z else {
                return nil
        }
        
        self.x = x
        self.y = y
        self.z = z
    }
    
}
