//
//  StringRegularExpressionsTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 30/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class StringRegularExpressionsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}

	// MARK: Operations tests
	
	func testOperatorMatchesInWithRegularExpressionAndString() {
		XCTAssertTrue("^[s|S]" ~?> "Some string...")
	}
	
	func testOperatorMatchesInWithWrongRegularExpressionAndString() {
		XCTAssertFalse("[s|S]$" ~?> "Some string...")
	}
	
	func testOperatorMatchesInWithEmptyRegularExpressionAndString() {
		XCTAssertFalse("" ~?> "Some string...")
	}
	
	func testOperatorMatchesInWithRegularExpressionAndEmptyString() {
		XCTAssertFalse("^[a]" ~?> "")
	}
	
	func testOperatorMatchesWithRegularExpressionAndString() {
		XCTAssertNotEqual("^[s|S]" ~~> "Some string...", [])
	}
	
	func testOperatorMatchesWithWrongRegularExpressionAndString() {
		XCTAssertEqual("[s|S]$" ~~> "Some string...", [])
	}
	
	func testOperatorMatchesWithEmptyRegularExpressionAndString() {
		XCTAssertEqual("" ~~> "Some string...", [])
	}
	
	func testOperatorMatchesWithRegularExpressionAndEmptyString() {
		XCTAssertEqual("^[a]" ~~> "", [])
	}

}
