// An obligatory Dice rolling struct

import Foundation

struct DiceSet {
    
    /**
     Basic dice roll function
     - Parameter dice: Number of dice to roll
     - Parameter sides: Number of sides on a die
     - Returns: tuple containing `total` : UInt32 being the sum of the individual die values, and `results` : [UInt32] being an array of all of the results
     */
    func roll(dice: UInt32, sides: UInt32) -> (total: UInt32, results: [UInt32]) {
        
        var results = [UInt32](repeatElement(0, count: Int(dice)))
        results = results.map {_ in
            arc4random_uniform(sides) + UInt32(1)
        }
        
        let total = results.reduce(0) { $0 + $1 }
        
        return (total, results)
    }
    /**
     Filter to show only the results from a roll set that are over a particular threshold value
     - Parameter threshold: the threshold that values must exceed
     - Parameter rolls: the roll set to check (an array of UInt32)
     - Returns: `number` : UInt32 being the number of dice with values exceeding the threshold, `total` : UInt32 being the sum of the dice with values exceeding the threshold, `values` : [UInt32] being all of the values exceeding the threshold.
    */
    func resultsOver(threshold: UInt32, fromRolls rolls: [UInt32]) -> (number: UInt32, total: UInt32, values: [UInt32]) {
        
        let resultsOver = rolls.filter {$0 > threshold}
        let number = UInt32(resultsOver.count)
        let total = resultsOver.reduce(0) {$0 + $1}
        return (number, total, resultsOver)
    }
    
    
}

// examples:
let diceSet = DiceSet()

let roll = diceSet.roll(dice: 10, sides: 6)
let highValues = diceSet.resultsOver(threshold: 3, rolls: roll.results)
highValues.number
highValues.total
