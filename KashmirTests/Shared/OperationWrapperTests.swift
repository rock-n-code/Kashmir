//
//  OperationWrapperTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class TestWrapper: OperationWrapper {
	
	// MARK: Events
	
	var onStarted: ExecutionBlock?
	var onFinished: ExecutionBlock?
	var onError: ErrorBlock?
	
	// MARK: Properties
	
	var name: String {
		return "test"
	}
	
	// MARK: Functions
	
	func run() {
		// ...
	}
	
}

// MARK: -

class OperationWrapperTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializer tests
	
	func testInit() {
		let wrapper = TestWrapper()
		
		XCTAssertNil(wrapper.onStarted)
		XCTAssertNil(wrapper.onFinished)
		XCTAssertNil(wrapper.onError)
		XCTAssertEqual(wrapper.name, "test")
	}
	
}
