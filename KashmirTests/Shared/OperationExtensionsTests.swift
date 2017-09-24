//
//  OperationExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 24/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation

@testable import Kashmir

class OperationExtensionsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}

	// MARK: Functions tests
	
	func testAddDependencies() {
		let operation = Operation()
		let firstDependency = Operation()
		let secondDependency = Operation()
		let thirdDependency = Operation()
		
		operation.add(dependencies: [firstDependency,
		                             secondDependency,
		                             thirdDependency])
		
		XCTAssertEqual(operation.dependencies.count, 3)
	}

}
