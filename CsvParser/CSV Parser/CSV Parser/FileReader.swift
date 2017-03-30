//
//  FileReader.swift
//  CSV Parser
//
//  Created by Alex Koumparos on 30/03/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

struct FileReader {
    
    static let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
    
    func save(string: String, withEncoding encoding: String.Encoding = .unicode, toFile filename: String, atLocation location: URL = FileReader.documentsUrl) -> Error? {
        
        let fileUrl = location.appendingPathComponent(filename)
        
        do {
            print("writing \"\(string)\" to \(fileUrl)")
            try string.write(to: fileUrl, atomically: true, encoding: encoding)
            return nil
        } catch {
            print("unable to save")
            print(error.localizedDescription)
            return error
        }
    }
    
}
