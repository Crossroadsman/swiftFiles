import Foundation


class KSSort {
    
    //MARK: - Helper methods
    //----------------------
    private func swap<T>(_ a: T, _ b: T) -> (T, T) {
        return (b, a)
    }
    
    private func insertIntoSorted<T: Comparable>(element: T, sortedList: [T]) -> [T] {
        
        if sortedList.isEmpty {
            return [element]
        }
        
        var i = sortedList.count - 1
        
        if element > sortedList[i] {
            return sortedList + [element]
        }
        
        if element < sortedList[0] {
            return [element] + sortedList
        }
        
        while i >= 0 {
            if element < sortedList[i] {
                i -= 1
                continue
            }
            
            let before = sortedList[0...i]
            let after = sortedList[(i+1)..<(sortedList.count)]
            
            return before + [element] + after
        }
        
        // the while loop should always return if it gets started
        print("error, this should never be executed")
        return sortedList + [element]
    }
    
    //MARK: - Sorts
    //-------------
    
    //MARK: Bubble
    //------------
    // Start out with index equal to the last element's position
    // Compares the first pair of elements
    // if lhs > rhs, swap positions
    // Compare the next pair (i.e., the rhs at the end of the last comparison is now the lhs for this comparison)
    // Repeat until completion of comparison where rhs is index
    // Decrement index and repeat until index == 0
    public func bubble<T: Comparable>(arr: [T]) -> [T] {
        
        // not strictly in-place by using workingArr, but avoids changing state outside the function.
        // Can trivially make this truly in-place by making arr inout and manipulating arr instead of workingArr
        var workingArr = arr
        var index = arr.count - 1
        
        while index > 0 {
            
            for lhs in 0 ... (index - 1) {
                
                if workingArr[lhs] > workingArr[lhs + 1] {
                    
                    (workingArr[lhs], workingArr[lhs + 1]) = swap(workingArr[lhs], workingArr[lhs + 1])
                    
                }
                
            }
            index -= 1
            
        }
        
        return workingArr
        
    }
    
    
    //MARK: Selection
    //---------------
    // go through all elements and find the smallest. Swap position of first element and that.
    // Repeat on remaining n-1 elements
    // After n cycles, the list is sorted
    public func selection<T: Comparable>(arr: [T]) -> [T] {
        
        // not strictly in-place by using workingArr, but avoids changing state outside the function.
        // Can trivially make this truly in-place by making arr inout and manipulating arr instead of workingArr
        var workingArr = arr
        let length = workingArr.count
        var index = 0
        
        while index < length {
            
            var smallestElementPosition = index
            
            for element in index ..< length {
                
                if workingArr[element] < workingArr[smallestElementPosition] {
                    smallestElementPosition = element
                }
            }
            
            (workingArr[index], workingArr[smallestElementPosition]) = swap(workingArr[index], workingArr[smallestElementPosition])
            index += 1
        }
        return workingArr
    }
    
    
    //MARK: Insertion
    //---------------
    // start with taking the head of the list and making that a new list
    // increment index and insert that element into the ordered new list (in position)
    // repeat until reach end of the list
    
    public func insertion<T: Comparable>(arr: [T]) -> [T] {
        
        guard arr.count > 1 else { return arr }
        
        var newList = [arr[0]]
        var index = 1
        
        while index < arr.count {
            newList = insertIntoSorted(element: arr[index], sortedList: newList)
            index += 1
        }
        
        return newList
    }
    

    
}

let nums = [2, 4, 2, 1, 3, 7, 0, -1, 5, 3]

let sorter = KSSort()
sorter.bubble(arr: nums)
sorter.selection(arr: nums)
sorter.insertion(arr: nums)
