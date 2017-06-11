//
//  DataStackModelTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 11/06/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

extension DataStack.Model {
	static let test = "Test"
}

class DataStackModelTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Static tests
	
	func testExtension() {
		XCTAssertNotNil(DataStack.Model.test)
		XCTAssertEqual(DataStack.Model.test, "Test")
	}

}

