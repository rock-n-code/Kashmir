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
		let operation = GroupOperation()
		
		XCTAssertNotNil(operation.queue)
		XCTAssertTrue(operation.queue.isSuspended)
		XCTAssertEqual(operation.queue.operationCount, 0)
	}

}
