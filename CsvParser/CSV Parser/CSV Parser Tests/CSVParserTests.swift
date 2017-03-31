//
//  CSVParserTests.swift
//  CSV Parser
//
//  Created by Alex Koumparos on 30/03/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import XCTest
@testable import CSV_Parser

class CSVParserTests: XCTestCase {
    
    var parser: CSVParser!

    override func setUp() {
        super.setUp()
        
        parser = CSVParser()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_Parse_String_ReturnsArrayOfArrays() {
        
        let testString = "This,is,first,line\r\nThis,is,second,line"
        let testArray: [[String]] = [["This","is","first","line"],["This","is","second","line"]]
        
        for i in 0 ..< testArray.count {
            XCTAssertEqual(testArray[i], parser.parse(string: testString)[i])
        }
        
        
    }
    

}
