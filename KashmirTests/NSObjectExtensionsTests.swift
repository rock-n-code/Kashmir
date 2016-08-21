//
//  NSObjectExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 21/08/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class Test: NSObject {}
class OtherTest: NSObject {}

class NSObjectExtensionsTests: XCTestCase {

	// MARK: - Setup

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: - Properties tests

	func testName() {
		XCTAssertEqual(Test.name, "Test")
		XCTAssertEqual(OtherTest.name, "OtherTest")
	}

	func testNameOfClass() {
		XCTAssertEqual(Test().nameClass, "Test")
		XCTAssertEqual(OtherTest().nameClass, "OtherTest")
	}

}
