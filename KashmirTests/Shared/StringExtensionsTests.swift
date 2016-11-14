//
//  StringExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class StringExtensionsTests: XCTestCase {

	// MARK: - Setup

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: - Properties tests

	func testUrlEncoded() {
		XCTAssertEqual("".urlEncoded, "")
		XCTAssertEqual("test".urlEncoded, "test")
		XCTAssertEqual("test/test".urlEncoded, "test%2Ftest")
		XCTAssertEqual("test/test=42".urlEncoded, "test%2Ftest%3D42")
	}
	
}
