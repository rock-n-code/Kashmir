//
//  StateMachineHandlerTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 28/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class StateMachineHandlerTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInit() {
		let logicController = TestLogicController()
		
		XCTAssertNotNil(logicController)
		XCTAssertNotNil(logicController.stateController)
	}

}
