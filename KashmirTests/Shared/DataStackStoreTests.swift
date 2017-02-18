//
//  DataStackStoreTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 04/01/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class DataStackStoreTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Properties tests
    
    func testRawValue() {
        XCTAssertEqual(DataStack.Store.sql.rawValue, NSSQLiteStoreType)
        XCTAssertEqual(DataStack.Store.xml.rawValue, NSXMLStoreType)
        XCTAssertEqual(DataStack.Store.binary.rawValue, NSBinaryStoreType)
        XCTAssertEqual(DataStack.Store.inMemory.rawValue, NSInMemoryStoreType)
    }
    
    func testExtensionValue() {
        XCTAssertEqual(DataStack.Store.sql.extensionValue, "sqlite")
        XCTAssertEqual(DataStack.Store.xml.extensionValue, "xml")
        XCTAssertEqual(DataStack.Store.binary.extensionValue, "bin")
        XCTAssertEqual(DataStack.Store.inMemory.extensionValue, "")
    }
    
}
