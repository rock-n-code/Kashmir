//
//  ConcurrentOperationTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation

@testable import Kashmir

class ConcurrentOperationTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInitWithExecutionBlock() {
		let testExpectation = expectation(description: "Init With Execution Block")
		let queue = OperationQueue()
		let operation = ConcurrentOperation {
			testExpectation.fulfill()
		}
		
		queue.name = "Concurrent Operation Test Init With Execution Block"
		
		operation.add(to: queue)
		
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(error)
		}
	}
	
	// MARK: Properties tests
	
	func testIsAsynchronous() {
		let operation = ConcurrentOperation()
		
		XCTAssertTrue(operation.isAsynchronous)
	}
	
	// MARK: Functions tests
	
	func testAddToQueue() {
		let queue = OperationQueue()
		let operation = ConcurrentOperation()
		
		queue.name = "Concurrent Operation Test Add To Queue"
		
		operation.add(to: queue)
		
		XCTAssertEqual(queue.operationCount, 1)
		XCTAssertEqual(queue.operations, [operation])
	}
	
}
