//
//  SynchronousOperationTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation
import Dispatch

@testable import Kashmir

class SynchronousOperationTests: XCTestCase {

	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Usage tests
	
	func testSynchronousOperation() {
		let queue = OperationQueue()
		let testExpectation = expectation(description: "Synchronous Operation Test")
		var testString = ""
		
		let firstOperation = SynchronousOperation {
			testString = "Tested1"
		}
		let secondOperation = SynchronousOperation {
			Thread.sleep(forTimeInterval: 2)
			testString = "Tested2"
			
			testExpectation.fulfill()
		}
		
		queue.name = "Synchronous Operation Test"
		
		firstOperation.add(to: queue)
		secondOperation.add(to: queue)
		
		XCTAssertFalse(firstOperation.isAsynchronous)
		XCTAssertFalse(secondOperation.isAsynchronous)
		
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(error)
			XCTAssertEqual(testString, "Tested2")
		}
	}
	
	// MARK: Functions tests

	func testCancel() {
		let testExpectation = expectation(description: "Synchronous Operation Cancel Test")
		let deadline = DispatchTime.now() + .seconds(2)
		let queue = OperationQueue()
		
		var testString = ""
		
		DispatchQueue.global(qos: .background).asyncAfter(deadline: deadline) {
			queue.cancelAllOperations()
			testExpectation.fulfill()
		}
		
		let firstOperation = SynchronousOperation {
			testString = "Tested1"
			
			Thread.sleep(forTimeInterval: 4)
		}
		let secondOperation = SynchronousOperation {
			testString = "Tested2"
		}
		
		queue.name = "Synchronous Operation Cancel Test"
		queue.maxConcurrentOperationCount = 1
		
		firstOperation.add(to: queue)
		secondOperation.add(to: queue)
		
		XCTAssertFalse(firstOperation.isAsynchronous)
		XCTAssertFalse(secondOperation.isAsynchronous)
		
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(error)
			XCTAssertEqual(testString, "Tested1")
		}
	}
	
}
