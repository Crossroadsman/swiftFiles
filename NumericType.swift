/**
Defines a NumericType protocol. All number types can conform to this protocol
We can then write numeric functions with generics that can be used by all number types
*/
protocol NumericType {

  func +(lhs: Self, rhs: Self) -> Self
  func -(lhs: Self, rhs: Self) -> Self
  func *(lhs: Self, rhs: Self) -> Self
  func /(lhs: Self, rhs: Self) -> Self
  func %(lhs: Self, rhs: Self) -> Self
  init (_ v: Int)

}

extension Int: NumericType { }
extension Double: NumericType { }
extension Float: NumericType { }

// example function (Swift version of average from the beginning of SICP)
//
// (define (average x y) (/ (+ x y) 2))
func average<T: NumericType>(X: T, y: T) -> T {

  return (x + y) / 2

}

