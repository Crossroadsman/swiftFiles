// Rational Number Type

// *** WARNING ***
// This is an early version
// It is easy for a fractional components to be computed that would exceed Int.max
// This could cause crashes or wrong data
// Care must be taken when using this Type that numerators and denominators do not get too close to Int.max
// (or even 3E9 which is approximately sqrt(Int.max))

import Foundation

struct Rational: Strideable, CustomStringConvertible {
    
    // Properties
    // ----------
    var numerator: Int
    var denominator: Int
    
    // required to conform to Strideable:
    // ----------------------------------
    static func ==(lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator / lhs.denominator == rhs.numerator / rhs.denominator
    }
    
    static func <(lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator / lhs.denominator < rhs.numerator / rhs.denominator
    }
    
    func distance(to other: Rational) -> Double {
        let newDenominator = other.denominator * self.denominator
        let newFromNumerator = other.denominator * self.numerator
        let newToNumerator = self.denominator * other.numerator
        let d = Rational(numerator: newToNumerator - newFromNumerator, denominator: newDenominator)
        //d.simplify()
        return Double(d.numerator) / Double(d.denominator)
    }
    
    
    // need to take a Rational.Stride (double?)
    // need to convert that to a fraction then
    // return it as a fraction
    func advanced(by n: Double) -> Rational {
        
        return self + Rational(n)
        
    }
    
    func advanced(by n: Int) -> Rational {
        
        return self + Rational(n)
        
    }
    
    // required to conform to CustomStringConvertible:
    // -----------------------------------------------
    var description: String {
        return "\(numerator)/\(denominator)"
    }
    
    // Initialisers
    // ------------
    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    init(_ i: Int) {
        self.numerator = i
        self.denominator = 1
    }
    
    
    init(_ d: Double) {
        // init to 1 to avoid "self used before initialised in continuedFraction call
        self.numerator = 1
        self.denominator = 1
        let t = continuedFraction(d)
        self.numerator = t.numerator
        self.denominator = t.denominator
    }
    
    
    // Structure-specific functions
    // ----------------------------
    static func +(lhs: Rational, rhs: Rational) -> Rational {
        let commmonDenominator = lhs.denominator * rhs.denominator
        let lhsNumerator = lhs.numerator * rhs.denominator
        let rhsNumerator = rhs.numerator * lhs.denominator
        var fraction = Rational(numerator: lhsNumerator + rhsNumerator, denominator: commmonDenominator)
        fraction.simplify()
        return fraction
    }
    
    static func *(lhs: Rational, rhs: Rational) -> Rational {
        var fraction = Rational(numerator: lhs.numerator * rhs.numerator, denominator: lhs.denominator * rhs.denominator)
        fraction.simplify()
        return fraction
    }
    
    static func /(lhs: Rational, rhs: Rational) -> Rational {
        let recipRhs = Rational(numerator: rhs.denominator, denominator: rhs.numerator)
        var fraction = lhs * recipRhs
        fraction.simplify()
        return fraction
    }
    
    static func -(lhs: Rational, rhs: Rational) -> Rational {
        let commmonDenominator = lhs.denominator * rhs.denominator
        let lhsNumerator = lhs.numerator * rhs.denominator
        let rhsNumerator = rhs.numerator * lhs.denominator
        var fraction = Rational(numerator: lhsNumerator - rhsNumerator, denominator: commmonDenominator)
        fraction.simplify()
        return fraction
        
    }

    
    private func gcd(m: Int, n: Int) -> Int {
        
        guard m > 0 else {
            return -1 * gcd(m: m * -1, n: n)
        }
        
        guard n > 0 else {
            return -1 * gcd(m: m, n: n * -1)
        }
        
        let tempM: Int
        let tempN = min(m, n)
        if tempN == m { tempM = n }
        else { tempM = m }
        
        let r = tempM % tempN
        if 0 == r { return tempN }
        return gcd(m: tempN, n: r)
    }
    
    mutating func simplify() {
        let g = gcd(m: numerator, n: denominator)
        if g > 1 {
            numerator = numerator / g
            denominator = denominator / g
        }
    }
    
    private func reciprocal(_ input: Rational) -> Rational {
        return Rational(numerator: input.denominator, denominator: input.numerator)
    }
    
    private func continuedFraction(_ input: Double, arr: [Int] = [], maxIterations: Int = 6) -> Rational {
        
        var workingArray = arr
        guard input != 0 else {
            return Rational(0)
        }
        
        guard input < 1 else {
            return Rational(Int(trunc(input))) + continuedFraction(input - trunc(input))
        }
        
        if workingArray.count >= maxIterations {
            // simplify and return
            var rat = Rational(0)
            while workingArray.count > 0 {
                
                let last = workingArray.removeLast()
                let lastRat = Rational(last)
                let continued = lastRat + rat
                rat = reciprocal(continued)
                
            }
            rat.simplify()
            return rat
        }
        
        // get next number for array
        let reciprocalOfRealPart = 1 / input
        let wholeNumberPart = trunc(reciprocalOfRealPart)
        let realPart = reciprocalOfRealPart - wholeNumberPart
        workingArray.append(Int(wholeNumberPart))
        return continuedFraction(realPart, arr: workingArray, maxIterations: maxIterations)
        
    }
    
       
}
