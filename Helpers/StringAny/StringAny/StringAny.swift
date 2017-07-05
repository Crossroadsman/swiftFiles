//
//  StringAny.swift
//  StringAny
//
//  Created by Alex Koumparos on 05/07/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

class StringAny {
    
    //This method will take Any and will return either its String representation or nil
    func stringOrNil(_ object: Any) -> String? {
        guard object is CustomStringConvertible else { return nil }
        
        return String(describing: object)
    }
    
    // This method will take Any and returns a String, being either the output as defined in the CustomStringConvertible implementation (if any), otherwise a String containing the type of the non-conforming object
    func stringAny(_ object: Any) -> String {
        return stringOrNil(object) ?? "\(type(of: object))"
    }
    
    // This method prints the contents of stringAny to the console
    // (A convenience method that can be used in place of print when
    // needing to print objects that may or may not be string representable)
    func printAny(_ object: Any) {
        print( stringAny(object) )
    }
    
}
