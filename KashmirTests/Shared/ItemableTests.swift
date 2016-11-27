//
//  ItemableTests.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 11/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

struct _Item: Itemable {}

extension _Item: CustomStringConvertible {
    
    var description: String {
        return "_ITEM"
    }
}

// MARK: -

class ItemableTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Initialization tests
    
    func testInit() {
        let item = _Item()
        
        XCTAssertNotNil(item)
    }
    
    // MARK: CustomStringConvertible tests
    
    func testDescription() {
        let item = _Item()
        
        XCTAssertNotNil(item.description)
        XCTAssertEqual(item.description, "_ITEM")
    }

}
