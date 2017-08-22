//
//  OperationQueueExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation

@testable import Kashmir

class OperationQueueExtensionsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInitWithNameMaxConcurrentOperationCount() {
		let queue = OperationQueue(name: "TestInitWithNameMaxConcurrentOperationCount",
		                           maxConcurrentOperationCount: 10)
		
		XCTAssertEqual(queue.name, "TestInitWithNameMaxConcurrentOperationCount")
		XCTAssertEqual(queue.maxConcurrentOperationCount, 10)
	}

	func testInitWithNameMaxConcurrentOperationCountQualityOfService() {
		let queue = OperationQueue(name: "TestInitWithNameMaxConcurrentOperationCountQualityOfService",
		                           maxConcurrentOperationCount: 10,
		                           qualityOfService: .background)
		
		XCTAssertEqual(queue.name, "TestInitWithNameMaxConcurrentOperationCountQualityOfService")
		XCTAssertEqual(queue.maxConcurrentOperationCount, 10)
		XCTAssertEqual(queue.qualityOfService, .background)
	}
	
	// MARK: Functions tests
	
	func testPauseAndResume() {
		let testExpectation = expectation(description: "Pause and Resume")
		let queue = OperationQueue(name: "QueuerTestPauseAndResume")
		
		var order = [Int]()
		
		let firstOperation = ConcurrentOperation {
			Thread.sleep(forTimeInterval: 2)
			
			order.append(0)
		}
		let secondOperation = ConcurrentOperation {
			order.append(1)
		}
		
		firstOperation.add(to: queue)
		secondOperation.add(to: queue)

		queue.pause()
		
		XCTAssertLessThanOrEqual(queue.operationCount, 2)
		testExpectation.fulfill()
		
		waitForExpectations(timeout: 5) { error in
			XCTAssertNil(error)
			XCTAssertTrue(queue.isSuspended)
			XCTAssertLessThanOrEqual(queue.operationCount, 2)
			XCTAssertNotEqual(order, [0, 1])
			
			queue.resume()
			
			XCTAssertFalse(queue.isSuspended)
		}
	}

}
