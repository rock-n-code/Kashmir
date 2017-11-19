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
	
	// MARK: Properties tests
	
	func testIsAsynchronous() {
		let operation = SynchronousOperation()
		
		XCTAssertFalse(operation.isAsynchronous)
	}
	
	// MARK: Functions tests
	
	func testCancel() {
		let testExpectation = expectation(description: "Synchronous cancel test")
		let queue = OperationQueue()
		
		var testString = ""
		
		let operation = SynchronousOperation {
			testString = "Tested1"
			
			Thread.sleep(forTimeInterval: 10.0)
			
			testString = "Tested2"
		}
		
		operation.add(to: queue)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
			operation.cancel()
			testExpectation.fulfill()
		}
		
		waitForExpectations(timeout: 12.5) { error in
			XCTAssertNil(error)
			XCTAssertEqual(testString, "Tested1")
			
			queue.cancelAllOperations()
		}
	}
	
}
