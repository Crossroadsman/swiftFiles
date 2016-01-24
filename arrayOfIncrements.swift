
func growArray(array: [Int], length: Int) -> [Int] {
  // function to recursively build an array of length n where each index has value index.
  // e.g., a 5 element array would be [0, 1, 2, 3, 4]
    var newArray = array
    switch array.count {
    case length:
        return newArray
    case (length - 1):
        newArray.append(newArray.count)
        return newArray
    default:
        newArray.append(newArray.count)
        return growArray(newArray, length: length)
        
    }
}

let id = growArray([], length: 10)
