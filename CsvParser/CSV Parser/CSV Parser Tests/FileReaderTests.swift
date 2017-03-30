//
//  FileReaderTests.swift
//  CSV Parser
//
//  Created by Alex Koumparos on 30/03/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import XCTest
@testable import CSV_Parser

class FileReaderTests: XCTestCase {
    
    var testFileReader: FileReader!
    let testString = "Hello, world"
    let testUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
    let testFileName = "helloTest.txt"
    var testFullUrl: URL!

    override func setUp() {
        super.setUp()
        testFullUrl = testUrl.appendingPathComponent(testFileName)
        
        testFileReader = FileReader()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_UnicodeString_CanBeWrittenToFile() {
        
        let _ = testFileReader.save(string: testString, withEncoding: .unicode, toFile: testFileName, atLocation: testUrl)
        
        // read back the file
        do {
            let testRead = try String.init(contentsOf: testFullUrl, encoding: .unicode)
            //let testRead = try String.init(contentsOf: testUrl.appendingPathComponent(testFileName))
            XCTAssertEqual(testString, testRead)
        } catch {
            XCTFail("unable to read from file: \(error.localizedDescription)")
        }
        
    }
    
    func test_Utf8String_CanBeWrittenToFile() {
        
        let _ = testFileReader.save(string: testString, withEncoding: .utf8, toFile: testFileName, atLocation: testUrl)
        
        // read back the file
        do {
            let testRead = try String.init(contentsOf: testFullUrl, encoding: .utf8)
            XCTAssertEqual(testString, testRead)
        } catch {
            XCTFail("unable to read from file: \(error.localizedDescription)")
        }
        
    }
    
    func test_unicodeFile_CanBeReadFromDisk() {
        
        // create the file
        do {
            try testString.write(to: testFullUrl, atomically: true, encoding: .unicode)
        } catch {
            XCTFail("unable to write file to begin test: \(error.localizedDescription)")
        }
        
    }


}
