//
//  StateMachineControllerTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class StateMachineControllerTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInit() {
		let controller = StateMachineController<TestFiniteState>()
		
		XCTAssertNotNil(controller)
		XCTAssertEqual(controller.state, FiniteMachineState<TestFiniteState>.none)
		XCTAssertNil(controller.onStateChanged)
	}
	
	// MARK: Functions
	
	func testStartWithNoneState() {
		let expectation = self.expectation(description: "Start in StateMachineController with none state")
		let controller = StateMachineController<TestFiniteState>()

		controller.onStateChanged = { state in
			XCTAssertEqual(state, .start)
			
			expectation.fulfill()
		}
		
		controller.start()
		
		waitForExpectations(timeout: 5.0) { error in
			XCTAssertNil(error)
		}
	}
	
	func testStartWithNoneStateAndAutomaticStart() {
		let expectation = self.expectation(description: "Start in StateMachineController with none state and automatic start")
		let controller = StateMachineController<OtherFiniteState>()
		
		controller.onStateChanged = { state in
			switch state {
			case .transit(_):
				XCTAssertEqual(state, .transit(.firstState))
				
				expectation.fulfill()
			default:
				break
			}
		}
		
		controller.start()
		
		waitForExpectations(timeout: 5.0) { error in
			XCTAssertNil(error)
		}
	}
	
	func testStartWithOtherState() {
		let expectation = self.expectation(description: "Start in StateMachineController with other state")
		let controller = StateMachineController<TestFiniteState>()
		
		controller.state = .start
		controller.onStateChanged = { state in
			XCTAssertEqual(state, .error(StateMachineError.cannotExecuteStart))
			
			expectation.fulfill()
		}
		
		controller.start()
		
		waitForExpectations(timeout: 5.0) { error in
			XCTAssertNil(error)
		}
	}
	
	func testRetryWithTransitState() {
		let expectation = self.expectation(description: "Retry in StateMachineController with transit state")
		let controller = StateMachineController<TestFiniteState>()
		
		controller.state = .transit(.firstState)
		controller.onStateChanged = { state in
			switch state {
			case .transit(let transitionalState):
				if transitionalState == .firstState {
					XCTAssertEqual(state, .transit(.firstState))
					
					expectation.fulfill()
				}
			default:
				break
			}
		}
		
		controller.retry()
		
		waitForExpectations(timeout: 5.0) { error in
			XCTAssertNil(error)
		}
	}
	
	func testRetryWithTransitStateFromStart() {
		let expectation = self.expectation(description: "Retry in StateMachineController with transit state from start")
		let controller = StateMachineController<OtherFiniteState>()
		
		controller.state = .transit(.firstState)
		controller.onStateChanged = { state in
			switch state {
			case .start:
				XCTAssertEqual(state, .start)
				
				expectation.fulfill()
			default:
				break
			}
		}
		
		controller.retry()
		
		waitForExpectations(timeout: 5.0) { error in
			XCTAssertNil(error)
		}
	}
	
	func testRetryWithOtherState() {
		let expectation = self.expectation(description: "Retry in StateMachineController with other state")
		let controller = StateMachineController<TestFiniteState>()
		
		controller.onStateChanged = { state in
			XCTAssertEqual(state, .error(StateMachineError.cannotExecuteRetry))
			
			expectation.fulfill()
		}
		
		controller.retry()
		
		waitForExpectations(timeout: 5.0) { error in
			XCTAssertNil(error)
		}
	}

}
