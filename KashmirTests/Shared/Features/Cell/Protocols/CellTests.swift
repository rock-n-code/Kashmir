//
//  CellTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 19/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class TestCell: Cell {

	// MARK: Types
	
	typealias CellData = String
	
	// MARK: Functions
	
	func set(with data: String) {
		print("DATA: \(data)")
		return
	}
	
}

// MARK: -

class CellTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Static tests
	
	func testNibName() {
		XCTAssertEqual(TestCell.nibName, "TestCell")
	}
	
	func testReuseIdentifier() {
		XCTAssertEqual(TestCell.reuseIdentifier, "TestCell")
	}
	
	func testEstimatedHeight() {
		XCTAssertEqual(TestCell.estimatedHeight, 0.0)
	}
	
}
