//
//  StringTests.swift
//  StringExtensions
//
//  Created by Alex Koumparos on 05/01/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import XCTest
@testable import StringExtensions

enum Constants {
    static let helloWorld = "Hello world"
    static let helloWorldLength = 11
    static let helloWorldSecondCharacter: Character = "e"
    static let substringStartPosition = 2
    static let substring = "llo world"
}

class StringTests: XCTestCase {
    
    var testString: String!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testString = Constants.helloWorld
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //MARK: At()
    //----------
    
    func test_StringAt_ValidPosition_ReturnsCharacter() {
        
        let testCharacter: Character? = Constants.helloWorldSecondCharacter // position 1
        XCTAssertEqual(testString.at(position: 1), testCharacter)
        
    }
    
    func test_StringAt_InvalidPosition_ReturnsNil() {
        
        XCTAssertNil(testString.at(position: Constants.helloWorldLength))
        
    }
    
    //MARK: length
    //------------
    
    func test_StringLength_ReturnsLength() {
        XCTAssertEqual(testString.length, Constants.helloWorldLength)
    }
    
    //MARK: substring()
    //-----------------
    
    func test_StringSubstring_FromPosition_ReturnsSubstringStartingAtPosition() {
        
        let from = Constants.substringStartPosition
        let substring: String? = Constants.substring
        XCTAssertEqual(testString.substring(from: from), substring)
        
    }
    
    func test_StringSubstring_FromInvalidPosition_ReturnsNil() {
        
        // from is past end of string
        var from = Constants.helloWorldLength + 1
        XCTAssertNil(testString.substring(from: from))
        
        // from is before start of string
        from = -1
        XCTAssertNil(testString.substring(from: from))
        
    }
    

}
