import Foundation

struct Pen: CustomStringConvertible {
    
    //MARK: Properties
    //----------------
    
    var name: String
    var cap: Cap?
    var barrel: Barrel
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    
    var description: String {
        return "\(name): A pen with \(cap != nil ? "\(cap!)" : "no cap") and \(barrel)"
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
        
        let baseDescription = "a cap with the following colours: \(colours) and made of \(materials)"
        
        guard artwork != nil else {
            return baseDescription
        }
        
        return "\(baseDescription) and featuring \(artwork!)"
    }
    
    
}

struct Barrel: CustomStringConvertible {
    
    // The colours of a particular instance, not the colours of the range
    var colours: [KSColour]
    
    // The materials of a particular instance, not the materials of the range
    var materials: [Material]
    
    var artwork: String?
    
    var nib: Nib
    
    //MARK: - Initialisers
    //--------------------
    
    init(nib: Nib, colours: [KSColour], materials: [Material]) {
        self.nib = nib
        self.colours = colours
        self.materials = materials
    }
    
    init(nib: Nib, colours: [KSColour], materials: [Material], artwork: String) {
        self.nib = nib
        self.colours = colours
        self.materials = materials
        self.artwork = artwork
    }
    
    //MARK: - Conform to CustomStringConvertible
    //------------------------------------------
    
    var description: String {
        
        let baseDescription = "a barrel with the following colours: \(colours) and made of \(materials)."
        
        guard artwork != nil else {
            return "\(baseDescription); having \(nib)"
        }
        
        return "\(baseDescription) and featuring \(artwork!); having \(nib)"
    }
    

    
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
    
    static let green = KSColour(name: "Green", red: 0, green: 1, blue: 0)
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
    static let goldPlate = Material(name: "Gold Plate")
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
let pilotMyu701Cap = Cap(colours: [NamedKSColour.silver], materials: [NamedMaterials.steel])
let parker88Cap = Cap(colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let parker45Cap = Cap(colours: [NamedKSColour.silver], materials: [NamedMaterials.steel])
let pelikanM1000Cap = Cap(colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let sailorImperialBlackCap = Cap(colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let pilotCustom743Cap = Cap(colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let lamySafariCap = Cap(colours: [NamedKSColour.petrolBlue], materials: [NamedMaterials.plastic])


// Nibs
//---------------------
let pilotMetropolitanNib = Nib(material: NamedMaterials.steel, colours: [NamedKSColour.silver], size: .medium, sizingBase: .japanese, shape: .round, flexibility: .hard)
let twsbiEcoNib = Nib(material: NamedMaterials.steel, colours: [NamedKSColour.silver], size: .medium, sizingBase: .western, shape: .round, flexibility: .hard)
let pilotNumber5Nib = Nib(material: NamedMaterials.gold14k, colours: [NamedKSColour.silver], size: .medium, sizingBase: .japanese, shape: .round, flexibility: .hard)
let namikiFalconNib = Nib(material: NamedMaterials.gold14k, colours: [NamedKSColour.gold], size: .medium, sizingBase: .japanese, shape: .round, flexibility: .soft)
let sailor1911Nib = Nib(material: NamedMaterials.gold14k, colours: [NamedKSColour.silver], size: .music, sizingBase: .japanese, shape: .round, flexibility: .hard)
let namikiPenguinNib = Nib(material: NamedMaterials.gold14k, colours: [NamedKSColour.gold], size: .medium, sizingBase: .japanese, shape: .round, flexibility: .hard)
let nakayaNib = Nib(material: NamedMaterials.gold14k, colours: [NamedKSColour.gold], size: .medium, sizingBase: .japanese, shape: .round, flexibility: .hard)
let pilotVanishingPointNib = Nib(material: NamedMaterials.gold18k, colours: [NamedKSColour.black], size: .fine, sizingBase: .japanese, shape: .round, flexibility: .hard)
let pilotMyu701Nib = Nib(material: NamedMaterials.steel, colours: [NamedKSColour.silver], size: .fine, sizingBase: .japanese, shape: .round, flexibility: .hard)
let parker88Nib = Nib(material: NamedMaterials.goldPlate, colours: [NamedKSColour.gold], size: .medium, sizingBase: .western, shape: .round, flexibility: .hard)
let parker45Nib = Nib(material: NamedMaterials.goldPlate, colours: [NamedKSColour.gold], size: .medium, sizingBase: .western, shape: .round, flexibility: .hard)
let pelikanM1000Nib = Nib(material: NamedMaterials.gold18k, colours: [NamedKSColour.gold, NamedKSColour.silver], size: .fine, sizingBase: .western, shape: .round, flexibility: .hard)
let sailorImperialBlackNib = Nib(material: NamedMaterials.gold21k, colours: [NamedKSColour.black], size: .medium, sizingBase: .japanese, shape: .round, flexibility: .hard)
let pilotNumber15Nib = Nib(material: NamedMaterials.gold14k, colours: [NamedKSColour.gold], size: .fine, sizingBase: .japanese, shape: .round, flexibility: .soft)
let lamySafariNib = Nib(material: NamedMaterials.steel, colours: [NamedKSColour.black], size: .medium, sizingBase: .western, shape: .round, flexibility: .hard)


// Barrels
//---------------------
let silverPilotMetropolitanBarrel = Barrel(nib: pilotMetropolitanNib, colours: [NamedKSColour.silver], materials: [NamedMaterials.genericAlloy])
let goldPilotMetropolitanBarrel = Barrel(nib: pilotMetropolitanNib, colours: [NamedKSColour.gold], materials: [NamedMaterials.genericAlloy])
let whiteTwsbiBarrel = Barrel(nib: twsbiEcoNib, colours: [NamedKSColour.clear, NamedKSColour.white], materials: [NamedMaterials.plastic])
let pilotCustomHeritage92Barrel = Barrel(nib: pilotNumber5Nib, colours: [NamedKSColour.clear], materials: [NamedMaterials.plastic])
let namikiFalconBarrel = Barrel(nib: namikiFalconNib, colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let sailor1911Barrel = Barrel(nib: sailor1911Nib, colours: [NamedKSColour.yellow], materials: [NamedMaterials.plastic])
let namikiPenguinBarrel = Barrel(nib: namikiPenguinNib, colours: [NamedKSColour.black], materials: [NamedMaterials.plastic], artwork: "Maki-e depictions of snowflakes and origami penguins")
let nakayaBarrel = Barrel(nib: nakayaNib, colours: kuroTamenuri, materials: [NamedMaterials.ebonite], artwork: "Taka Maki-e pink lotus flower")
let pilotVanishingPointBarrel = Barrel(nib: pilotVanishingPointNib, colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let pilotMyu701Barrel = Barrel(nib: pilotMyu701Nib, colours: [NamedKSColour.silver], materials: [NamedMaterials.steel])
let parker88Barrel = Barrel(nib: parker88Nib, colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let parker45Barrel = Barrel(nib: parker45Nib, colours: [NamedKSColour.silver], materials: [NamedMaterials.steel])
let pelikanM1000Barrel = Barrel(nib: pelikanM1000Nib, colours: [NamedKSColour.green, NamedKSColour.black], materials: [NamedMaterials.plastic])
let sailorImperialBlackBarrel = Barrel(nib: sailorImperialBlackNib, colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let pilotCustom743Barrel = Barrel(nib: pilotNumber15Nib, colours: [NamedKSColour.black], materials: [NamedMaterials.plastic])
let lamySafariBarrel = Barrel(nib: lamySafariNib, colours: [NamedKSColour.petrolBlue], materials: [NamedMaterials.plastic])


// Pens
//----------------------
let silverPilotMetropolitan = Pen(name: "Pilot Metropolitan (silver)", cap: silverPilotMetropolitanCap, barrel: silverPilotMetropolitanBarrel)
let goldPilotMetropolitan = Pen(name: "Pilot Metropolitan (gold)", cap: goldPilotMetropolitanCap, barrel: goldPilotMetropolitanBarrel)
let twsbiEco = Pen(name: "TWSBI Eco", cap: whiteTwsbiCap, barrel: whiteTwsbiBarrel)
let pilotCustomHeritage92 = Pen(name: "Pilot Custom Heritage 92", cap: pilotCustomHeritage92Cap, barrel: pilotCustomHeritage92Barrel)
let namikiFalcon = Pen(name: "Namiki Falcon", cap: namikiFalconCap, barrel: namikiFalconBarrel)
let sailor1911 = Pen(name: "Sailor 1911 Demonstrator", cap: sailor1911Cap, barrel: sailor1911Barrel)
let namikiPenguin = Pen(name: "Namiki Nippon Tradition Origami Penguin", cap: namikiPenguinCap, barrel: namikiPenguinBarrel)
let nakaya = Pen(name: "Nakaya Portable Writer Lotus Flower", cap: nakayaCap, barrel: nakayaBarrel)
let pilotVanishingPoint = Pen(name: "Pilot Vanishing Point", cap: nil, barrel: pilotVanishingPointBarrel)
let pilotMyu701 = Pen(name: "Pilot Myu 701", cap: pilotMyu701Cap, barrel: pilotMyu701Barrel)
let parker88 = Pen(name: "Parker 88", cap: parker88Cap, barrel: parker88Barrel)
let parker45 = Pen(name: "Parker 45", cap: parker45Cap, barrel: parker45Barrel)
let pelikanM1000 = Pen(name: "Pelikan M1000", cap: pelikanM1000Cap, barrel: pelikanM1000Barrel)
let sailorImperialBlack = Pen(name: "Sailor Imperial Black", cap: sailorImperialBlackCap, barrel: sailorImperialBlackBarrel)
let pilotCustom743 = Pen(name: "Pilot Custom 743", cap: pilotCustom743Cap, barrel: pilotCustom743Barrel)
let lamySafari = Pen(name: "Lamy Safari", cap: lamySafariCap, barrel: lamySafariBarrel)


let myPens = [silverPilotMetropolitan, goldPilotMetropolitan, twsbiEco, pilotCustomHeritage92, namikiFalcon, sailor1911, namikiPenguin, nakaya, pilotVanishingPoint, pilotMyu701, parker88, parker45, pelikanM1000, sailorImperialBlack, pilotCustom743, lamySafari]


print(myPens[0])

print(myPens[1].barrel.nib)

for pen in myPens {
    print(pen)
}
