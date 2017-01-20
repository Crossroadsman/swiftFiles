//
//  String.swift
//  StringExtensions
//
//  Created by Alex Koumparos on 05/01/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

extension String {
    /**
     - Returns: `characters.count`
    */
    var length: Int {
        return self.characters.count
    }
    
    /**
     Convenient way to get Character at a position provided that the String is a string of simple characters
     - Parameter position: the index of the character to return
     - Returns: Optional(Character) (optional in case position is out of bounds)
     */
    func at(position i: Int) -> Character? {
        let arr = Array(self.characters)
        
        guard i < arr.count && i >= 0 else {
            return nil
        }
        
        return Character(String(arr[i]))
    }
    
    /**
     - Parameter from: Int (default = 0), the position of the first character in the substring
     - Parameter to: optional Int (default = nil), the position **after** the last character in the substring
    */
    func substr(from: Int = 0, to toOptional: Int? = nil) -> String? {
        
        let to: Int

        let arr = Array(self.characters)
        
        switch toOptional {
        case nil:
            to = arr.count
        case _ where toOptional! <= from:
            return nil
        case _ where toOptional! > arr.count:
            return nil
        default:
            to = toOptional!
        }
        
        guard from < arr.count && from >= 0 else {
            return nil
        }
        
        let subArr = Array(arr[from ..< to]).map { String($0) }
        
        return subArr.joined()
    }
    
    /**
     returns the character at position from Right (zero-based)
     character is formatted as String
     returns an empty String if the position is invalid
     */
    func fromRight(_ position: Int) -> String {
        let chars = self.characters
        let length = chars.count
        
        guard position >= 0 && position <= length - 1 else {
            return ""
        }
        
        // convert position to position from left
        let p = (length - 1) - position
        
        // access as array
        let a = Array(chars)[p]
        
        // convert back to String for convenience
        return String(a)
    }
    
}
