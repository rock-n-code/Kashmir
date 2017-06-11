//
//  SectionableTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 11/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

struct _Section: Sectionable {
    
    // MARK: Properties
    
    var index: Int
    var id: String
    
}

extension _Section: CustomStringConvertible {
    
    var description: String {
        return "_SECTION:\n" +
                "- Index: \(index)\n" +
                "- Id: \(id)\n"
    }
}

extension _Section: CustomDebugStringConvertible {

	var debugDescription: String {
		return description
	}
	
}

// MARK: -

class SectionableTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Initialization tests
    
    func testInit() {
        let section = _Section(index: 0, id: "0")
        
        XCTAssertNotNil(section)
        XCTAssertEqual(section.index, 0)
        XCTAssertEqual(section.id, "0")
    }
    
    // MARK: Hashable tests
    
    func testHashable() {
        let section = _Section(index: 0, id: "0")

        XCTAssertNotNil(section.hashValue)
    }
    
    // MARK: Equatable tests
    
    func testEqual() {
        let aSection = _Section(index: 0, id: "0")
        let otherSection = _Section(index: 0, id: "0")
        
        XCTAssertTrue(aSection == otherSection)
    }
    
    func testNotEqual() {
        let aSection = _Section(index: 0, id: "0")
        let otherSection = _Section(index: 0, id: "1")
        
        XCTAssertTrue(aSection != otherSection)
    }
    
    // MARK: CustomStringConvertible tests
    
    func testDescription() {
        let section = _Section(index: 0, id: "0")
        
        XCTAssertNotNil(section.description)
    }

}
