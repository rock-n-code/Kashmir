//
//  FiniteMachineStateTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class FiniteMachineStateTests: XCTestCase {
	
	// MARK: Types
	
	typealias TestState = FiniteMachineState<TestFiniteState>
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Static tests
	
	func testEqual() {
		XCTAssertEqual(TestState.none, TestState.none)
		XCTAssertEqual(TestState.start, TestState.start)
		XCTAssertEqual(TestState.transit(.firstState), TestState.transit(.startState))
		XCTAssertEqual(TestState.finish, TestState.finish)
		XCTAssertEqual(TestState.error(nil), TestState.error(nil))
	}
	
	func testNotEqual() {
		XCTAssertNotEqual(TestState.none, TestState.finish)
		XCTAssertNotEqual(TestState.start, TestState.error(nil))
		XCTAssertNotEqual(TestState.transit(.firstState), TestState.transit(.thirdState))
		XCTAssertNotEqual(TestState.finish, TestState.start)
		XCTAssertNotEqual(TestState.error(nil), TestState.none)
	}

}
