//
//  String.swift
//  StringExtensions
//
//  Created by Alex Koumparos on 05/01/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

extension String {
    
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
        
        guard i < arr.count else {
            return nil
        }
        
        return Character(String(arr[i]))
    }
    
}
