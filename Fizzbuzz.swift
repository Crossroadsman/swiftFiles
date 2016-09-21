func fb ( _ input: Int) -> String {
    switch input {
        case _ where input % 15 == 0:
            return "fizzbuzz"
        case _ where input % 3 == 0:
            return "fizz"
        case _ where input % 5 == 0:
            return "buzz"
        default:
            return String(input)
    }
}

(1 ..< 100).map({fb($0)}).forEach { print($0) }

// With print in body

func printFB (_ input: Int) {
    switch input {
    case _ where input % 15 == 0:
        print( "fizzbuzz" )
    case _ where input % 3 == 0:
        print( "fizz")
    case _ where input % 5 == 0:
        print( "buzz")
    default:
        print( String(input))
    }
}

(1 ..< 100).forEach { printFB($0) }
