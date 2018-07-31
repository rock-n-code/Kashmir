//
//  ConstantTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 01/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class ConstantTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializer tests
	
	func testInit() {
		let constant = Constant("test")
		
		XCTAssertNotNil(constant)
	}
	
	// MARK: Properties tests
	
	func testValue() {
		let constant = Constant("test")
		
		XCTAssertEqual(constant.value, "test")
	}
	
	// MARK: Functions tests
	
	func testEqual() {
		let oneConstant = Constant("test")
		let otherConstant = Constant("test")
		
		XCTAssertTrue(oneConstant == otherConstant)
		XCTAssertFalse(oneConstant != otherConstant)
	}
	
	func testNotEqual() {
		let oneConstant = Constant("test")
		let otherConstant = Constant("tset")
		
		XCTAssertTrue(oneConstant != otherConstant)
		XCTAssertFalse(oneConstant == otherConstant)
	}
	
}

