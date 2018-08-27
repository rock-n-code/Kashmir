//
//  FiniteStateTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

enum TestFiniteState {
	case firstState
	case secondState
	case thirdState
}

extension TestFiniteState: FiniteState {

	// MARK: Static
	
	static var startState: TestFiniteState {
		return .firstState
	}
	
	// MARK: Properties
	
	var isFinalState: Bool {
		return self == .thirdState
	}
	
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
	
	// MARK: Properties tests
	
	func testIsFinalState() {
		XCTAssertFalse(TestFiniteState.firstState.isFinalState)
		XCTAssertFalse(TestFiniteState.secondState.isFinalState)
		XCTAssertTrue(TestFiniteState.thirdState.isFinalState)
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
