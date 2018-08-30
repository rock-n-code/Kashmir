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
	
	func testInit() {
		let operation = ConcurrentOperation()
		
		XCTAssertNotNil(operation)
		XCTAssertNil(operation.executionBlock)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
		XCTAssertTrue(operation.isConcurrent)
	}
	
	func testInitWithExecutionBlock() {
		let operation = ConcurrentOperation {}

		XCTAssertNotNil(operation)
		XCTAssertNotNil(operation.executionBlock)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
		XCTAssertTrue(operation.isConcurrent)
	}
	
	// MARK: Properties tests
	
	func testIsAsynchronous() {
		let operation = ConcurrentOperation()
		
		XCTAssertTrue(operation.isAsynchronous)
	}
	
	// MARK: Functions tests
	
	func testExecute() {
		let testExpectation = expectation(description: "ConcurrentOperation execute test")
		let queue = OperationQueue()
		let operation = ConcurrentOperation {
			testExpectation.fulfill()
		}
		
		operation.add(to: queue)
		
		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertFalse(operation.isExecuting)
			XCTAssertTrue(operation.isFinished)
			XCTAssertFalse(operation.isCancelled)
		}
	}
	
	func testPause() {
		let testExpectation = expectation(description: "ConcurrentOperation pause test")
		let queue = OperationQueue()
		let operation = ConcurrentOperation {
			Thread.sleep(forTimeInterval: 10.0)
		}

		operation.add(to: queue)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
			operation.pause()
			testExpectation.fulfill()
		}
		
		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertFalse(operation.isExecuting)
			XCTAssertFalse(operation.isFinished)
			XCTAssertFalse(operation.isCancelled)
			
			queue.cancelAllOperations()
		}
	}
	
	func testResume() {
		let testExpectation = expectation(description: "ConcurrentOperation resume test")
		let queue = OperationQueue()
		let operation = ConcurrentOperation {
			Thread.sleep(forTimeInterval: 10.0)
		}
		
		operation.add(to: queue)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
			operation.pause()
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
			operation.resume()
			testExpectation.fulfill()
		}
		
		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertTrue(operation.isExecuting)
			XCTAssertFalse(operation.isFinished)
			XCTAssertFalse(operation.isCancelled)
			
			queue.cancelAllOperations()
		}
	}
	
	func testCancel() {
		let testExpectation = expectation(description: "ConcurrentOperation cancel test")
		let queue = OperationQueue()
		let operation = ConcurrentOperation {
			Thread.sleep(forTimeInterval: 10.0)
		}
		
		operation.add(to: queue)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
			operation.cancel()
			testExpectation.fulfill()
		}

		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertTrue(operation.isExecuting)
			XCTAssertFalse(operation.isFinished)
			XCTAssertTrue(operation.isCancelled)
			
			queue.cancelAllOperations()
		}
	}
	
	func testAddToQueue() {
		let queue = OperationQueue()
		let operation = ConcurrentOperation {}

		operation.add(to: queue)
		
		XCTAssertEqual(queue.operationCount, 1)
		XCTAssertEqual(queue.operations, [operation])
	}
	
}
