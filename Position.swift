import Foundation

struct Position: Equatable {
    
    //MARK: - Supporting Types
    //------------------------
    
    //MARK: Constants
    private enum PositionConstants {
        
        static let min_x = 0
        static let max_x = 7
        
        static let min_y = 0
        static let max_y = 7
        
        static let min_z = 0
        static let max_z = 0
    }
    
    //MARK: Other enums
    private enum Axis {
        case x, y, z
    }
    
    private enum PositionError: Error {
        case outOfBounds(axis: String, minValue: Int, maxValue: Int)
    }
    
    //MARK: - Properties
    //------------------
    private var x: Int
    private var y: Int
    private var z: Int
    
    //MARK: - Initialisers
    //--------------------
    init?(x: Int, y: Int, z: Int = 0) {
        
        guard Position.isValid(axis: .x, value: x) &&
              Position.isValid(axis: .y, value: y) &&
              Position.isValid(axis: .z, value: z) else {
                return nil
        }
        
        self.x = x
        self.y = y
        self.z = z
    }
    
    //MARK: Accessors
    //---------------
    
    public func getPosition() -> (x: Int, y: Int, z: Int) {
        return (x, y, z)
    }
    
    public mutating func setPosition(x: Int, y: Int, z: Int) throws {
        guard Position.isValid(axis: .x, value: x) else {
            throw PositionError.outOfBounds(axis: "x", minValue: PositionConstants.min_x, maxValue: PositionConstants.max_x)
        }
        guard Position.isValid(axis: .y, value: y) else {
            throw PositionError.outOfBounds(axis: "y", minValue: PositionConstants.min_y, maxValue: PositionConstants.max_y)
        }
        guard Position.isValid(axis: .z, value: z) else {
            throw PositionError.outOfBounds(axis: "z", minValue: PositionConstants.min_z, maxValue: PositionConstants.max_z)
        }
        
        self.x = x
        self.y = y
        self.z = z
    }
    
    /**
    This is a non-throwing setter for a Position.
    If, as is typical, the setter completes successfully, it returns `true`,
    If the setter fails with an out-of-bounds error (the kind of error that is the reason that the primary setter is `throwing`) it 
    returns false,
    If the setter fails for any other reason, it will fatalError
    */ 
    public mutating func quickSetPosition(x: Int, y: Int, z: Int) -> Bool {
        
        do {
            try self.setPosition(x: x, y: y, z:z)
        } catch PositionError.outOfBounds(let errorDetails) {
            print("(x: \(x), y: \(y), z: \(z)) is out of bounds: \(errorDetails.axis) must be between \(errorDetails.minValue) and \(errorDetails.maxValue)"
                  return false
        } catch {
            print("Some unexpected error (not an out of bounds error) occurred.")
            fatalError()
        }
        return true
        
    }
    
    //MARK: - Other Methods
    //---------------------
    /**
     Checks whether a specified value is between the min and max for a particular axis.
     */
    private static func isValid(axis: Axis, value: Int) -> Bool {
        switch axis {
        case .x:
            if value >= PositionConstants.min_x && value <= PositionConstants.max_x {
                return true
            }
        case .y:
            if value >= PositionConstants.min_y && value <= PositionConstants.max_y {
                return true
            }
        case .z:
            if value >= PositionConstants.min_z && value <= PositionConstants.max_z {
                return true
            }
        }
        return false
        
    }
    
    //MARK: - Protocol Conformance
    //----------------------------
    
    //MARK: Equatable
    static func ==(lhs: Position, rhs: Position) -> Bool {
        if lhs.x == rhs.x &&
           lhs.y == rhs.y &&
           lhs.z == rhs.z {
            return true
        } else {
            return false
        }
    }
    
        
}

// EXAMPLES
var position1 = Position(x: -1, y: 8) // nil
var position2 = Position(x: 3, y: 2, z: 0)
let position3 = Position(x: 3, y: 2)
let position4 = Position(x: 2, y: 3)
let position5 = Position(x: 3, y: 2, z: 1)

position2 == position3
position3 == position4

// Note that attempting to set the position of a nil Position will leave the entity as nil and won't raise an error
position1?.getPosition()
do {
    try position1?.setPosition(x: 3, y: 2, z: 0)
} catch {
    print(error.localizedDescription)
}
position1?.getPosition()

position2?.getPosition()
do {
    try position2?.setPosition(x: 4, y: 3, z: 0)
} catch {
    print(error.localizedDescription)
}
position2?.getPosition()

position2?.getPosition().x
