struct Pen: CustomStringConvertible {
    
    //MARK: Properties
    //----------------
    
    var cap: Cap?
    var barrel: Barrel
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    
    var description: String {
        return "A pen with \(cap != nil ? "\(cap!)" : "no cap") and \(barrel)"
    }
    
}

struct Cap: CustomStringConvertible {
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    
    var description: String {
        return "a cap with the following colours: \(colours)"
    }
    
    // The colours of a particular instance, not the colours of the range
    var colours: [KSColour]
    
}

struct Barrel: CustomStringConvertible {
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    
    var description: String {
        return "a barrel with the following colours: \(colours)"
    }
    
    // The colours of a particular instance, not the colours of the range
    var colours: [KSColour]
    
}

struct KSColour: CustomStringConvertible {
    
    private let name: String?
    private let red: Double
    private let green: Double
    private let blue: Double
    
    public var nameDescription: String? {
        return name
    }
    
    public var rgbDescription: String {
        return "red: \(red), green: \(green), blue: \(blue)"
    }
    
    public var fullDescription: String {
        guard name != nil else {
            return rgbDescription
        }
        
        return "\(nameDescription!) (\(rgbDescription))"
    }
    
    //MARK: - Initializers
    //--------------------
    init(name: String?, red: Double, green: Double, blue: Double) {
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    
    init(red: Double, green: Double, blue: Double) {
        self.init(name: nil, red: red, green: green, blue: blue)
    }
    
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    var description: String {
        guard name != nil else {
            return "Red: \(red), Green: \(green), Blue: \(blue)"
        }
        return nameDescription!
    }
    
    //MARK: - Integrate with UIColor
    //------------------------------
    //(maybe this needs to be a separate helper class in UIKit-compatible apps)
}

enum NamedKSColour {
    static let petrolBlue = KSColour(name: "Petrol Blue", red: 25.0/255, green: 46.0/255, blue: 66.0/255)
}

let myPen = Pen(cap: Cap(colours: [NamedKSColour.petrolBlue]), barrel: Barrel(colours: [NamedKSColour.petrolBlue]))

print(myPen)

NamedKSColour.petrolBlue.fullDescription
