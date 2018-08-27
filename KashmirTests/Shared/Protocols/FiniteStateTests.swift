//
//  FiniteStateTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

enum TestFiniteState: Equatable {
	case firstState
	case secondState
	case thirdState
}

extension TestFiniteState: FiniteState {

	// MARK: Static
	
	static var startState: TestFiniteState {
		return .firstState
	}
	
	static var endStates: [TestFiniteState] {
		return [.thirdState]
	}
	
	static var shouldStartAutomatically: Bool {
		return false
	}
	
	static var shouldEndAutomatically: Bool {
		return false
	}
	
	static var shouldRetryFromStart: Bool {
		return false
	}
	
	// MARK: Properties
	
	var nextState: TestFiniteState? {
		switch self {
		case .firstState:
			return .secondState
		case .secondState:
			return .thirdState
		default:
			return nil
		}
	}
	
	// MARK: Functions
	
	func canTransit(toState state: TestFiniteState) -> Bool {
		switch (self, state) {
		case (.firstState, .secondState),
			 (.secondState, .thirdState):
			return true
		default:
			return false
		}
	}
	
}

// MARK: - 

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
