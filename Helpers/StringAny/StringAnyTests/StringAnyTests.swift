//
//  StringAnyTests.swift
//  StringAnyTests
//
//  Created by Alex Koumparos on 05/07/17.
//  Copyright © 2017 Koumparos Software. All rights reserved.
//

import XCTest
@testable import StringAny

class StringAnyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_StringOrNil_ConformingType_ReturnsOptionalStringNotEqualToNil() {
        
        let sot = StringAny()
        let result = sot.stringOrNil(1)
        
        if result == nil {
            XCTFail("value was nil, and shouldn't be")
        } else {
            print("test_StringOrNil_ConformingType_ReturnsOptionalStringNotEqualToNil(): \(result)")
            XCTAssertTrue(result! is String)
        }
    }
    
    func test_StringOrNil_NonConformingType_ReturnsNil() {
        
        let sot = StringAny()
        
        struct NonConformingType {
            let name: String = ""
        }
        
        let nonConformingTestObject = NonConformingType()
        
        let result = sot.stringOrNil(nonConformingTestObject)
        print("test_StringOrNil_NonConformingType_ReturnsNil(): \(result)")
        XCTAssertNil(result)
    }
    
    
}
