import Foundation

String(0xFF0000, radix: 16)
0xff0000
String(16711680, radix: 16)

let testInt = 0x123456
let testString = "0xABCDEF"
let testString2 = "ABCDEF"
let testString3 = "#ABCDEF"

extension Int {
    func asHex(withLeadingIndicator: Bool = true) -> String {
        if withLeadingIndicator {
            return "0x\(String(self, radix: 16))"
        } else {
            return String(self, radix: 16)
        }
    }
}

extension String {
    /**
     returns 0 if string is invalid as hex
     automatically strips 0x and # as applicable
     */
    func hexToInt() -> Int {
        if self.hasPrefix("0x") {
            let index = self.index(self.startIndex,offsetBy: 2)
            let str = self.substring(from: index)
            return Int(str, radix: 16) ?? 0
        } else if self.hasPrefix("#") {
            let index = self.index(self.startIndex, offsetBy: 1)
            let str = self.substring(from: index)
            return Int(str, radix: 16) ?? 0
        } else {
            return Int(self, radix: 16) ?? 0
        }
    }
}

testInt.asHex()
testString.hexToInt()
testString2.hexToInt()
testString3.hexToInt()

// BUT WHY
// The way Swift handles Strings today (note, probably different tomorrow)
// is that we need to index through a particular string (an unavoidable consequence of Swift strings being Unicode compliant, where particular characters can be different lengths)

let sampleString = "Hello, world"

// work forward

let indexS = sampleString.index(sampleString.startIndex, offsetBy: 1)

let substringFromStart = sampleString.substring(from: indexS)


// work backward
// complicated by bounds.
// REMEMBER: 1. endIndex returns the position AFTER the end of the last character in the string. e.g., for a two character string "Hi", the startIndex is 0 and the endIndex is 2
// 2. substring(to:) ends before the specified position (like the to: in Stride (vs through))
let indexE = sampleString.index(sampleString.endIndex, offsetBy: -1) // ATTENTION: the endIndex is the character AFTER the last character in the String, so offsetBy: 0 would be out of bounds

let substringFromEnd = sampleString.substring(to: indexE)

sampleString.endIndex
sampleString.startIndex
