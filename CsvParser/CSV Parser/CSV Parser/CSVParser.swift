//
//  CSVParser.swift
//  CSV Parser
//
//  Created by Alex Koumparos on 30/03/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

/**
 References to spec are to RFC 4180 CSV spec described at:
 https://tools.ietf.org/html/rfc4180
 */
struct CSVParser {
    
    enum ParseState {
        case normal
        case quote
        case crlf
        //case comma
    }
    
    /**
     This works for CSVs that are formatted according to the spec.
     Apparently, unix-style CSV files deviate from the spec in certain important regards. Unix-style files are not currently supported.
     
     Deviations (according to https://www.csvreader.com/csv_format.php):
     - records might be separated by just LF (ASCII 13 or 0x0D) or CR (ASCII 10 or 0x0A);
     - commas might be escaped with backslashes (and backslashes would thus also be escaped, but quotes would not);
     - CR and LF might or might not be escaped in a field, or their values might be replaced with \r and \n respectively;
     - the first header row might have more columns than the other rows (but all other rows should have the same number of columns);
     - and more
     */
    func parse(string: String) -> [[String]] {
        
        let chars = Array(string.characters)
        
        var position = 0
        var parseState = ParseState.normal
        
        var records = [[String]]()
        
        var fields = [String]()
        
        var currentField = [String]()
        
        while position < chars.count {
            
            switch parseState {
                
            case .normal:
                
                switch chars[position] {
                    
                case "\"":
                    
                    parseState = .quote
                    
                case ",":
                    
                    let str = currentField.joined()
                    fields.append(str)
                    currentField = []
                    //parseState = .comma
                    
                case "\r":
                    
                    parseState = .crlf
                    
                default:
                    
                    currentField.append(String(chars[position]))
                }
                
            case .quote:
                
                switch chars[position] {
                    
                case "\"":
                    parseState = .normal
                    
                default:
                    currentField.append(String(chars[position]))
                    
                }
                
            case .crlf:
                
                switch chars[position] {
                case "\n":
                    
                    let str = currentField.joined()
                    fields.append(str)
                    currentField = []
                    records.append(fields)
                    fields = []
                    parseState = .normal
                    
                default:
                    
                    currentField.append("\r")
                    currentField.append(String(chars[position]))
                    parseState = .normal
                    
                }
            }
            position += 1
            
        }
        
        // final row
        // (the file should not end with a comma or CRLF)
        fields.append(currentField.joined())
        records.append(fields)

        return records
        
    }
    
    
}
