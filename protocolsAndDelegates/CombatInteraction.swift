/*:
 Combat Interaction Delegate
 ===========================
 
 This is a simple protocol/delegate illustration to show how a person class can be implemented and hand off control of interactions to a separate interaction manager.
 
 Observe that the Person object doesn't need to know how to handle combat, it only needs to know how its health is affected by hits and how its experience by killing an opponent (without the object itself even knowing that it killed the opponent).
 */

protocol InteractionDelegate {
    
    func didTakeDamage(amount: Int)
    func didGetExperience(amount: Int)
    
}

class Person : InteractionDelegate {
    
    private var _name: String
    private var _health: Int
    private var _attack: Int
    private var _experience: Int = 0
    private var _experienceValue: Int = 10
    
    var name: String {
        return _name
    }
    
    var health: Int {
        return _health
    }
    
    var attack: Int {
        return _attack
    }
    
    var experience: Int {
        return _experience
    }
    
    var experienceValue: Int {
        return _experienceValue
    }
    
    init(name: String, health: Int, attack: Int) {
        _name = name
        _health = health
        _attack = attack
    }
    
    // MARK: - Delegate Methods
    // ------------------------
    
    // MARK: Interaction Delegate
    // --------------------------
    
    func didTakeDamage(amount: Int) {
        _health -= amount
    }
    
    func didGetExperience(amount: Int) {
        _experience += amount
    }
}


class InteractionManager {
    
    static let sharedInstance = InteractionManager()
    private init() {}
    
    func fight(attacker: Person, defender: Person) {
        
        print("\(attacker.name) hits \(defender.name) for \(attacker.attack) damage.")
        defender.didTakeDamage(amount: attacker.attack)
        print("\(defender.name)'s health is reduced to \(defender.health)")
        if defender.health <= 0 {
            print("\(defender.name) is killed!")
            print("\(attacker.name) gets \(defender.experienceValue) xp!")
            attacker.didGetExperience(amount: defender.experienceValue)
        }
    }
}

let finn = Person(name: "Finn", health: 10, attack: 100)
let iceKing = Person(name: "Ice King", health: 25, attack: 15)


InteractionManager.sharedInstance.fight(attacker: finn, defender: iceKing)
