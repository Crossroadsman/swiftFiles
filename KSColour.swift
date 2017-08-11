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
    
    // The colours of a particular instance, not the colours of the range
    var colours: [KSColour]
    
    
    // The materials of a particular instance, not the materials of the range
    var materials: [Material]
    
    // An optional string to describe any artwork on the cap
    var artwork: String?
    
    
    //MARK: Initialisers

    init(colours: [KSColour], materials: [Material]) {
        self.colours = colours
        self.materials = materials
    }
    
    init(colours: [KSColour], materials: [Material], artwork: String) {
        self.colours = colours
        self.materials = materials
        self.artwork = artwork
    }
    
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    
    var description: String {
        
        var baseDescription = "a cap with the following colours: \(colours) and made of \(materials)"
        
        guard artwork != nil else {
            return baseDescription
        }
        
        return "\(baseDescription) and featuring \(artwork!)"
    }
    
    
}

struct Barrel: CustomStringConvertible {
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    
    var description: String {
        return "a barrel with the following colours: \(colours) and made of \(materials). Having a \(nib)."
    }
    
    // The colours of a particular instance, not the colours of the range
    var colours: [KSColour]
    
    // The materials of a particular instance, not the materials of the range
    var materials: [Material]
    
    
    var nib: Nib
    
    
}

struct Nib: CustomStringConvertible {
    
    let material: Material
    let colours: [KSColour]
    let size: NibLocalSize
    let sizingBase: SizingBase
    let shape: NibShape
    let flexibility: NibFlexibility
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    var description: String {
        
        return "A \(flexibility) \(material) nib with \(colours) colours; of size \(size) (\(sizingBase)) and ground to \(shape)."
    }
}

enum NibLocalSize {
    case ultraExtraFine
    case extraFine
    case fine
    case mediumFine
    case medium
    case broad
    case doubleBroad
    case music
}

enum SizingBase {
    case japanese
    case western
}

enum NibShape {
    case round
    case formalItalic
    case architect
    case cursiveItalic
}

enum NibFlexibility {
    case hard
    case soft
    case vintageFlex
}

struct Material: CustomStringConvertible {
    
    let name: String
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    var description: String {
        return name
    }
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
    static let white = KSColour(name: "White", red: 1, green: 1, blue: 1)
    static let black = KSColour(name: "Black", red: 0, green: 0, blue: 0)
    static let clear = KSColour(name: "Clear", red: 1, green: 1, blue: 1)
    
    
    static let silver = KSColour(name: "Silver", red: 0.7, green: 0.7, blue: 0.7)
    static let gold = KSColour(name: "Gold", red: 0.8, green: 0.8, blue: 0.1)
    static let roseGold = KSColour(name: "Rose Gold", red: 0.9, green: 0.7, blue: 0.1)
    
    static let yellow = KSColour(name: "Yellow", red: 1, green: 1, blue: 0)
    static let red = KSColour(name: "Red", red: 1, green: 0, blue: 0)
    
    static let petrolBlue = KSColour(name: "Petrol Blue", red: 25.0/255, green: 46.0/255, blue: 66.0/255)
    static let darkRed = KSColour(name: "Dark Red", red: 0.6, green: 0, blue: 0)

    
}


enum NamedMaterials {
    static let plastic = Material(name: "Plastic")
    static let aluminium = Material(name: "Aluminium")
    static let steel = Material(name: "Steel")
    static let ebonite = Material(name: "Ebonite")
    static let gold14k = Material(name: "Gold (14k)")
    static let gold18k = Material(name: "Gold (18k)")
    static let gold21k = Material(name: "Gold (21k)")
    static let brass = Material(name: "Brass")
    static let genericAlloy = Material(name: "Generic metal alloy")
}


let kuroTamenuri = [NamedKSColour.darkRed, NamedKSColour.red]


// Caps
//---------------------
let silverPilotMetropolitanCap = Cap(colours: [NamedKSColour.silver], materials: [NamedMaterials.genericAlloy])
let goldPilotMetropolitanCap = Cap(colours: [NamedKSColour.gold], materials: [NamedMaterials.genericAlloy])
let whiteTwsbiCap = Cap(colours: [NamedKSColour.white], materials: [NamedMaterials.plastic])
let pilotCustomHeritage92Cap = Cap(colours: [NamedKSColour.clear], materials: [NamedMaterials.plastic])
let namikiFalconCap = Cap(colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let sailor1911Cap = Cap(colours: [NamedKSColour.yellow], materials: [NamedMaterials.plastic])
let namikiPenguinCap = Cap(colours: [NamedKSColour.black], materials: [NamedMaterials.plastic], artwork: "Maki-e origami penguins and snowflakes")
let nakayaCap = Cap(colours: kuroTamenuri, materials: [NamedMaterials.ebonite])
//let


// Barrels
//---------------------


// Nibs
//---------------------
let pilotMetropolitanNib = Nib(material: NamedMaterials.steel, colours: [NamedKSColour.silver], size: .medium, sizingBase: .japanese, shape: .round, flexibility: .hard)
let twsbiEcoNib = Nib(material: NamedMaterials.steel, colours: [NamedKSColour.silver], size: .medium, sizingBase: .western, shape: .round, flexibility: .hard)

// Pens
//----------------------
let silverPilotMetropolitan = Pen(cap: Cap(colours: [NamedKSColour.silver], materials: [NamedMaterials.genericAlloy]), barrel: Barrel(colours: [NamedKSColour.silver], materials: [NamedMaterials.genericAlloy], nib: pilotMetropolitanNib))
let goldPilotMetropolitan = Pen(cap: Cap(colours: [NamedKSColour.gold], materials: [NamedMaterials.genericAlloy]), barrel: Barrel(colours: [NamedKSColour.gold], materials: [NamedMaterials.genericAlloy], nib: pilotMetropolitanNib))
let twsbiEco = Pen(cap: Cap(colours: [NamedKSColour.white], materials: [NamedMaterials.plastic]), barrel: Barrel(colours: [NamedKSColour.clear, NamedKSColour.white], materials: [NamedMaterials.plastic], nib: twsbiEcoNib))



let myPens = [silverPilotMetropolitan, goldPilotMetropolitan, twsbiEco]


print(namikiPenguinCap)
