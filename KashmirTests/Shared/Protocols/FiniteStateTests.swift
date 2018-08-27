//
//  FiniteStateTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class FiniteStateTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Static tests
	
	func testStartState() {
		XCTAssertEqual(TestFiniteState.startState, TestFiniteState.firstState)
	}
	
	func testEndStates() {
		XCTAssertEqual(TestFiniteState.endStates, [TestFiniteState.thirdState])
	}
	
	func testShouldStartAutomatically() {
		XCTAssertFalse(TestFiniteState.shouldStartAutomatically)
	}
	
	func testShouldEndAutomatically() {
		XCTAssertFalse(TestFiniteState.shouldEndAutomatically)
	}
	
	func testShouldRetryFromStart() {
		XCTAssertFalse(TestFiniteState.shouldRetryFromStart)
	}
	
	// MARK: Properties tests
	
	func testIsEndState() {
		XCTAssertFalse(TestFiniteState.firstState.isEndState)
		XCTAssertFalse(TestFiniteState.secondState.isEndState)
		XCTAssertTrue(TestFiniteState.thirdState.isEndState)
	}
	
	func testNextState() {
		XCTAssertEqual(TestFiniteState.firstState.nextState, TestFiniteState.secondState)
		XCTAssertEqual(TestFiniteState.secondState.nextState, TestFiniteState.thirdState)
		XCTAssertNil(TestFiniteState.thirdState.nextState)
	}
	
	// MARK: Functions tests
	
	func testCanTransitToRightNextState() {
		XCTAssertTrue(TestFiniteState.firstState.canTransit(toState: .secondState))
		XCTAssertTrue(TestFiniteState.secondState.canTransit(toState: .thirdState))
	}
	
	func testCanTransitToWrongNextState() {
		XCTAssertFalse(TestFiniteState.firstState.canTransit(toState: .thirdState))
		XCTAssertFalse(TestFiniteState.secondState.canTransit(toState: .secondState))
	}

}
