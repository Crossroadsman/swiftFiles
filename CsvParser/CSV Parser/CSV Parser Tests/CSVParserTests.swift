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

    func test_BreakLines_WhenSetNonStrict_ReturnsArrayOfLinesSplitByNewLine() {
        
        let testString = "\nThis\nIs\n\nA\n\r\nTest"
        let testArray = ["This","Is","A","Test"]
        print(testString)
        
        XCTAssertEqual(testArray, parser.breakLines(string: testString))
    }
    
    func test_BreakLines_WhenSetStrict_ReturnsArrayOfLinesSplitByCRLF() {
        
        let testString = "\nThis\nIs\n\nA\n\r\nTest"
        let testArray = ["\nThis\nIs\n\nA\n","Test"]
        print(testString)
        
        XCTAssertEqual(testArray, parser.breakLines(string: testString, strict: true))
    }
    
    /*
    func test_BreakFields_ReturnsArrayOfFieldsSplitByComma() {
        
        let testString = "This,Is,A,Test"
        let testArray = ["This","Is","A","Test"]
        
        
        
    }
 */

}
