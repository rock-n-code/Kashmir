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

class TestGroup: GroupOperation {
	
	// MARK: Initializers
	
	override init() {
		super.init()
		
		queue.name = "Test group operation"
		queue.qualityOfService = .userInitiated
	}
	
	// MARK: ConcurrentOperation
	
	override func execute() {
		let firstOperation = ConcurrentOperation {}
		let secondOperation = ConcurrentOperation {
			Thread.sleep(forTimeInterval: 5.0)
		}
		let thirdOperation = ConcurrentOperation {}
		
		thirdOperation.completionBlock = {
			self.finish()
		}
		
		queue.add(chainedOperations: [firstOperation,
									  secondOperation,
									  thirdOperation])
	}
}

// MARK: - 

class GroupOperationTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInit() {
		let operation = GroupOperation()
		
		XCTAssertNotNil(operation)
		XCTAssertNil(operation.error)
		XCTAssertNotNil(operation.queue)
		XCTAssertNil(operation.executionBlock)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
		XCTAssertTrue(operation.isConcurrent)
		XCTAssertTrue(operation.queue.isSuspended)
		XCTAssertEqual(operation.queue.operationCount, 0)
	}

	// MARK: Functions tests
	
	func testExecute() {
		let testExpectation = expectation(description: "GroupOperation execute test")
		let queue = OperationQueue()
		let operation = TestGroup()
		
		operation.completionBlock = {
			testExpectation.fulfill()
		}
		
		operation.add(to: queue)
		
		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertFalse(operation.isExecuting)
			XCTAssertTrue(operation.isFinished)
			XCTAssertFalse(operation.isCancelled)
			XCTAssertFalse(operation.queue.isSuspended)
		}
	}
	
	func testPause() {
		let testExpectation = expectation(description: "GroupOperation pause test")
		let queue = OperationQueue()
		let operation = TestGroup()
		
		operation.add(to: queue)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			operation.pause()
			testExpectation.fulfill()
		}
		
		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertFalse(operation.isExecuting)
			XCTAssertFalse(operation.isFinished)
			XCTAssertFalse(operation.isCancelled)
			XCTAssertTrue(operation.queue.isSuspended)
			
			queue.cancelAllOperations()
		}
	}
	
	func testResume() {
		let testExpectation = expectation(description: "GroupOperation resume test")
		let queue = OperationQueue()
		let operation = TestGroup()
		
		operation.add(to: queue)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			operation.pause()
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
			operation.resume()
			testExpectation.fulfill()
		}
		
		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertTrue(operation.isExecuting)
			XCTAssertFalse(operation.isFinished)
			XCTAssertFalse(operation.isCancelled)
			XCTAssertFalse(operation.queue.isSuspended)
			
			queue.cancelAllOperations()
		}
	}
	
	func testCancel() {
		let testExpectation = expectation(description: "GroupOperation cancel test")
		let queue = OperationQueue()
		let operation = TestGroup()
		
		operation.add(to: queue)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
			operation.cancel()
			testExpectation.fulfill()
		}
		
		waitForExpectations(timeout: 10.0) { error in
			XCTAssertNil(error)
			XCTAssertFalse(operation.isExecuting)
			XCTAssertTrue(operation.isFinished)
			XCTAssertTrue(operation.isCancelled)
			XCTAssertFalse(operation.queue.isSuspended)
			
			queue.cancelAllOperations()
		}
	}

}
