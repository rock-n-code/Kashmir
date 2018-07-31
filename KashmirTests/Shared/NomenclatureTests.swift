//
//  NomenclatureTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 01/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class NomenclatureTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializer tests
	
	func testInit() {
		let name = Nomenclature("test")
		
		XCTAssertNotNil(name)
	}
	
	// MARK: Properties tests
	
	func testValue() {
		let name = Nomenclature("test")
		
		XCTAssertEqual(name.value, "test")
	}
	
	// MARK: Functions tests
	
	func testEqual() {
		let oneName = Name("test")
		let otherName = Name("test")
		
		XCTAssertTrue(oneName == otherName)
		XCTAssertFalse(oneName != otherName)
	}
	
	func testNotEqual() {
		let oneName = Name("test")
		let otherName = Name("tset")
		
		XCTAssertTrue(oneName != otherName)
		XCTAssertFalse(oneName == otherName)
	}
	
}

