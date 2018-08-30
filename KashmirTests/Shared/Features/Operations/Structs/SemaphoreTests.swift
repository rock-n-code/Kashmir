//
//  SemaphoreTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation

@testable import Kashmir

class SemaphoreTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Usage tests
	
	func testWithSemaphore() {
		let semaphore = Semaphore()
		let queue = OperationQueue()
		let testExpectation = expectation(description: "Operation with Semaphore")
		
		var testString = ""
		
		let operation = ConcurrentOperation {
			Thread.sleep(forTimeInterval: 2)
			
			testString = "Tested"
			
			semaphore.continue()
		}
		
		queue.name = "Operation Test With Semaphore"

		operation.add(to: queue)
		semaphore.wait()
		
		XCTAssertEqual(testString, "Tested")
		
		testExpectation.fulfill()
		
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(error)
		}
	}
	
	func testWithoutSemaphore() {
		let queue = OperationQueue() //Queuer(name: "SemaphoreTestWithoutSemaphore")
		let testExpectation = expectation(description: "Operation without Semaphore")
		
		var testString = ""
		
		let operation = ConcurrentOperation {
			Thread.sleep(forTimeInterval: 2)
			
			testString = "Tested"
			
			testExpectation.fulfill()
		}
		
		queue.name = "Semaphore Test Without Semaphore"
		
		operation.add(to: queue)
		
		XCTAssertEqual(testString, "")
		
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(error)
			XCTAssertEqual(testString, "Tested")
		}
	}
}
