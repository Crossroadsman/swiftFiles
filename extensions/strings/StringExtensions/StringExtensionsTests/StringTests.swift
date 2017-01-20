//
//  StringTests.swift
//  StringExtensions
//
//  Created by Alex Koumparos on 05/01/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

/*
 NOTE: Adding unit tests to Command Line Application projects in XCode is not intuitive.
 See: https://otters.io/xctest-in-command-line-applications
 
 In addition to the steps described in the link, also had to manually add each file under test to the test target (in the inspector pane)
 */

import XCTest
@testable import StringExtensions

enum Constants {
    static let helloWorld = "Hello world"
    static let helloWorldLength = 11
    static let helloWorldSecondCharacter: Character = "e"
    
    static let substrStartPosition = 2
    static let substrFrom = "llo world"
    
    static let substrEndPosition = 9
    static let substrTo = "Hello wor"
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
        
        // beyond range
        XCTAssertNil(testString.at(position: Constants.helloWorldLength))
        
        // negative
        XCTAssertNil(testString.at(position: -1))
        
    }
    
    //MARK: length
    //------------
    
    func test_StringLength_ReturnsLength() {
        XCTAssertEqual(testString.length, Constants.helloWorldLength)
    }
    
    //MARK: substr()
    //--------------
    
    func test_StringSubstr_FromPosition_ReturnsSubstringStartingAtPosition() {
        
        let from = Constants.substrStartPosition
        let substring: String? = Constants.substrFrom
        
        XCTAssertEqual(testString.substr(from: from), substring)
        
    }
    
    
    func test_StringSubstr_FromInvalidPosition_ReturnsNil() {
        
        // from is past end of string
        var from = Constants.helloWorldLength + 1
        XCTAssertNil(testString.substr(from: from))
        
        // from is before start of string
        from = -1
        XCTAssertNil(testString.substr(from: from))
        
    }
    
    
    func test_StringSubStr_ToValidPosition_ReturnsSubstringEndingImmediatelyBeforePosition() {
        
        let to = Constants.substrEndPosition
        let substring: String? = Constants.substrTo
        
        XCTAssertEqual(testString.substr(to: to), substring)
        
    }
    
    func test_StringSubStr_ToInvalidPosition_ReturnsNil() {
        
        // to is past end of string + 1
        // (see the distinction between to and through (in, e.g., stride)
        // for why to is the character beyond where we want to land
        var to = Constants.helloWorldLength + 2
        XCTAssertNil(testString.substr(to: to))
        
        // to is before start of string
        to = -1
        XCTAssertNil(testString.substr(to: to))
        
    }
    
    //MARK: fromRight
    func test_StringFromRight_ToValidPosition_ReturnsValidCharacterAsString() {
        
        var validPos = 0
        var validVal = "d"
        XCTAssertEqual(testString.fromRight(validPos),validVal)
        
        validPos = 1
        validVal = "l"
        XCTAssertEqual(testString.fromRight(validPos),validVal)
        
    }
    
    func test_StringFromRight_ToInvalidPosition_ReturnsEmptyString() {
        let expectedOutput = ""
        var invalidPos = -1
        XCTAssertEqual(testString.fromRight(invalidPos), expectedOutput)
        
        invalidPos = 100
        XCTAssertEqual(testString.fromRight(invalidPos), expectedOutput)
    }
    

}
