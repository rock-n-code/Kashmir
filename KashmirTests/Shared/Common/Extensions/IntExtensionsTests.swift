//
//  IntExtensionsTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 31/05/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class IntExtensionsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}

	// MARK: Initializer tests
	
	func testInitFalse() {
		XCTAssertEqual(Int(bool: false), 0)
	}
	
	func testInitTrue() {
		XCTAssertEqual(Int(bool: true), 1)
	}

}
