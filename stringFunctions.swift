func characterAtIndex(str: String, index: Int) -> Character {
    // returns the character at a given index
    // doesn't perform any bounds checking
    
    let fromStart = str.startIndex
    let endPosAsInt = index // zero-based
    let endPosAsIndex = fromStart.advancedBy(endPosAsInt)
    return str[endPosAsIndex]
}

characterAtIndex("dealing with strings is not that hard", index: 8)

func substr(str: String, start: Int, end: Int) -> String {
    
    // This function does not do any testing to make sure start/end values are within the string length. May cause unexpected behaviour if inappropriate values are entered
    
    let startIndex = str.startIndex.advancedBy(start)
    let endIndex = str.startIndex.advancedBy(end)
    let range = startIndex...endIndex
    return str[range]
    
}

func substr(str: String, start: Int, length: Int) -> String {
    
    // convenience function that calls the regular substr function with a length instead of an end value
    
    let end = start + length - 1
    return substr(str, start: start, end: end)
    
}

substr("hello there", start: 3, end: 7)
substr("hello there", start: 3, length: 5)



