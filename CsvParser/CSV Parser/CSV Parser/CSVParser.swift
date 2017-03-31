//
//  CSVParser.swift
//  CSV Parser
//
//  Created by Alex Koumparos on 30/03/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

struct CSVParser {
    
    /**
     Takes a string and splits by newline (either \n or \r\n).
     Note that the RFC 4180 CSV spec described at https://tools.ietf.org/html/rfc4180 only describes CRLF (\r\n) as a line break.
     
     Setting strict to true will force only breaking on \r\n
     */
    func breakLines(string: String, strict: Bool = false) -> [String] {
        
        var arr: [String] = []
        
        if strict {
            arr = string.components(separatedBy: "\r\n")
        } else {
            arr = string.components(separatedBy: .newlines)
        }
        
        return arr.filter {$0 != ""}

        
    }
    
}
