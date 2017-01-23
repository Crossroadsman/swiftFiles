/*

This creates a general Number (Num) type like in Haskell

*/

import Foundation

protocol Num {

    // methods already implemented in number types in Swift
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    
    /*
    // methods in Haskell not already implemented in Swift for every number type
    // these would need to be implemented for each number type that wanted to conform to Num
    static func negate(_ a: Self) -> Self
    static func abs(_ a: Self) -> Self
    static func signum(_ a: Self) -> Self
    // not clear how the following could theoretically be implemented as Swift has no arbitrary size integer type
    // static func fromInteger(_ a: Integer) -> Self
    
}

extension Int: Num {}
extension Double: Num {}
extension Float: Num {}
//etc


// example of defining a function that is generic across all number types:
func add<T: Num>(a: T, b: T) -> T {
    return a + b
}
