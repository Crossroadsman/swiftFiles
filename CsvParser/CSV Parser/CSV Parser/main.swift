//
//  main.swift
//  CSV Parser
//
//  Created by Alex Koumparos on 30/03/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import Foundation

let fileReader = FileReader()
//let fileName = "csvtest.txt"
let fileName = "linkedin_connections_export_microsoft_outlook.csv"
let encoding = String.Encoding.ascii

do {
    let fileData = try fileReader.load(fileName: fileName, encoding: encoding)
    print(fileData)
    let records = CSVParser().parse(string: fileData)
    for record in records {
        for field in record {
            print(field, terminator: " | ")
        }
        print("\n------------")
    }
} catch {
    print(error.localizedDescription)
}


// Illustration of reading and writing a file
/*
let str = "Hello, world"
//get url to the documents directory in the sandbox
let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL

//add a filename
let filename = "foo.txt"
let fileUrl = documentsUrl.appendingPathComponent(filename)

//write to it
do {
    print("writing to: \(fileUrl)")
    try str.write(to: fileUrl, atomically: true, encoding: .unicode)
} catch {
    fatalError("unable to write to file")
}

//read the file
do {
    //let readFile = try String.init(contentsOf: fileUrl, encoding: .unicode)
    let readFile = try String.init(contentsOf: fileUrl)
    print(readFile)
} catch {
    fatalError("unable to read from file")
}
 */



