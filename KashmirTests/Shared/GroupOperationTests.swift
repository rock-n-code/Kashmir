//
//  GroupOperationTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 14/11/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation

@testable import Kashmir

class GroupOperationTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInitWithExecutionBlock() {
		let operation = GroupOperation {}
		
		XCTAssertNotNil(operation.queue)
		XCTAssertTrue(operation.queue.isSuspended)
		XCTAssertEqual(operation.queue.operationCount, 0)
	}
	
	// MARK: Functions tests
	
	func testStart() {
		let testExpectation = expectation(description: "Group Operation start")
		let queue = OperationQueue()
		let operation = GroupOperation {
			testExpectation.fulfill()
		}
		
		queue.name = "Group Operation Start"

		operation.add(to: queue)
		
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(error)
		}
	}

}
