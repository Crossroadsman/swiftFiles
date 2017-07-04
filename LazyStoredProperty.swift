// This is a simple illustration of how a lazy stored property might be used.
// Copy and paste this code into a Playground to watch where the property gets initialised.
// Experiment with uncommenting the two print statements at the bottom of the page.

import UIKit

class ExpensiveComputation {
    
    private func makeALongListOfInts() -> [Int] {
        // 50,000 is enough to take a few seconds in a playground on
        // a 6-core 2013 mac pro running Xcode 9b2
        // vary this number if the target device is significantly
        // faster or slower
        let iterations = 50_000
        
        var nums = [Int]()
        (0 ..< iterations).forEach { _ in nums.append( Int(arc4random_uniform(UInt32.max)) ) }
        return nums
    }
    
    func ints() -> [Int] {
        return makeALongListOfInts()
    }
}

class ExampleClass {
    
    lazy var expensiveToComputeProperty = ExpensiveComputation().ints()
    
    var someOtherStoredProperty = ExpensiveComputation().ints()
    
    func getTheExpensiveProperty() -> [Int] {
        return expensiveToComputeProperty
    }
    
}

let myExample = ExampleClass()

//print( myExample.someOtherStoredProperty )
//print(myExample.getTheExpensiveProperty())
