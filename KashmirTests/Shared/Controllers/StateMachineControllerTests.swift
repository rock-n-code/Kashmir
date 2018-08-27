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
	

}
