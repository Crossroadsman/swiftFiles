//
//  StringTests.swift
//  StringExtensions
//
//  Created by Alex Koumparos on 05/01/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import XCTest
@testable import StringExtensions

class StringTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //MARK: At()
    //----------
    
    func test_StringAt_ValidPosition_ReturnsCharacter() {
        
        let testString = "hello world"
        let testCharacter: Character? = "e" // position 1
        XCTAssertEqual(testString.at(position: 1), testCharacter)
        
    }
    
    func test_StringAt_InvalidPosition_ReturnsNil() {
        
        let testString = "0123"
        XCTAssertNil(testString.at(position: 4))
        
    }
    
    //MARK: length
    //------------
    
    func test_StringLength_ReturnsLength() {
        let testString = "hello world"
        XCTAssertEqual(testString.length, 11)
    }

}
