/*
2 functions to search 2D arrays

maxMatchesInColumns(match:arr:) takes a value (conforming to Equatable) to match and a 2D array. 
It returns the length of the longest matching vertical sequence

maxMatchesInColumnsWithLocation(match:arr) takes a value (conforming to Equatable) to match and a 2D array. 
It returns a tuple containing the length of the longest matching vertical sequence, the starting row and the starting column

*/


import Foundation

let arr = [[0, 1, 0, 0, 1, 0],
           [0, 1, 0, 0, 1, 0],
           [0, 0, 1, 0, 1, 0],
           [0, 0, 0, 1, 1, 0]]

var match = 1

/**
 searches a 2D array to find the longest vertical sequence of a specified value.
 - Returns: Int being the length of the longest sequence
 */
func maxMatchesInColumns <T: Equatable> (match: T, arr: [[T]]) -> Int {
    
    var matchCount = 0
    var maxMatchCount = 0
    
    for col in stride(from: 0, to: arr[0].count, by: 1) {
        for row in stride(from: 0, to: arr.count, by: 1) {
            print("row: \(row), col: \(col)")
            if match == arr[row][col] {
                matchCount += 1
                if maxMatchCount < matchCount {
                    maxMatchCount = matchCount
                }
                continue
            }
            matchCount = 0
        }
        matchCount = 0
    }
    
    return maxMatchCount
    
}

/**
 searches a 2D array to find the longest vertical sequence of a specified value
 - Returns: (Int, Int, Int) being the length, the starting row and the starting column
 */
func maxMatchesInColumnsWithLocation <T: Equatable> (match: T, arr: [[T]]) -> (length: Int, row: Int, col: Int) {
    
    var matchCount = 0
    var maxMatchCount = 0
    var rowOfMaxMatchStart = -1
    var colOfMaxMatchStart = -1
    var rowOfCurrentMatchStart = -1
    var colOfCurrentMatchStart = -1
    
    
    for col in stride(from: 0, to: arr[0].count, by: 1) {
        for row in stride(from: 0, to: arr.count, by: 1) {
            print("row: \(row), col: \(col)")
            if match == arr[row][col] {
                if (0 == matchCount) {
                    rowOfCurrentMatchStart = row
                    colOfCurrentMatchStart = col
                }
                matchCount += 1
                
                if maxMatchCount < matchCount {
                    maxMatchCount = matchCount
                    rowOfMaxMatchStart = rowOfCurrentMatchStart
                    colOfMaxMatchStart = colOfCurrentMatchStart
                    
                }
                continue
            }
            matchCount = 0
        }
        matchCount = 0
    }
    
    return (maxMatchCount, rowOfMaxMatchStart, colOfMaxMatchStart)
    
}


print(maxMatchesInColumns(match: match, arr: arr))

print(maxMatchesInColumnsWithLocation(match: match, arr: arr))
