//
//  OperationRunnerTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 19/11/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class TestRunner: OperationRunner {
	
	// MARK: Properties
	
	var queue: OperationQueue
	
	// MARK: Initializers
	
	init() {
		self.queue = OperationQueue()
	}
	
	// MARK: Functions
	
	func run() {
		// ...
	}
	
}

// MARK: -

class OperationRunnerTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInit() {
		let runner = TestRunner()
		
		XCTAssertNotNil(runner)
		XCTAssertNotNil(runner.queue)
	}

}
