//
//  ResultTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 07/01/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

enum TestError: Error {
	case test
}

// MARK: -

class ResultTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Properties tests
	
	func testVoidValue() {
		let result = Result<Void>.value(())

		XCTAssertNotNil(result)
		XCTAssertNotNil(result.value)
		XCTAssertNil(result.error)
	}
	
	func testBoolValue() {
		let result = Result<Bool>.value(true)
		
		XCTAssertNotNil(result)
		XCTAssertEqual(result.value!, true)
		XCTAssertNil(result.error)
	}
	
	func testIntValue() {
		let result = Result<Int>.value(0)
		
		XCTAssertNotNil(result)
		XCTAssertEqual(result.value!, 0)
		XCTAssertNil(result.error)
	}
	
	func testStringValue() {
		let result = Result<String>.value("test")
		
		XCTAssertNotNil(result)
		XCTAssertEqual(result.value!, "test")
		XCTAssertNil(result.error)
	}
	
	func testArrayValue() {
		let result = Result<[Int]>.value([0, 1, 2])
		
		XCTAssertNotNil(result)
		XCTAssertEqual(result.value!, [0, 1, 2])
		XCTAssertNil(result.error)
	}
	
	func testDictionaryValue() {
		let result = Result<[String: Int]>.value(["a": 0, "b": 1, "c": 2])
		
		XCTAssertNotNil(result)
		XCTAssertEqual(result.value!, ["a": 0, "b": 1, "c": 2])
		XCTAssertNil(result.error)

	}
	
	func testError() {
		let result = Result<Void>.error(TestError.test)
		
		XCTAssertNotNil(result)
		XCTAssertNil(result.value)
		XCTAssertNotNil(result.error)
	}
	
	// MARK: Initializations tests 
	
	func testInitWIthValue() {
		let result = Result {
			return true
		}
		
		XCTAssertNotNil(result)
		XCTAssertEqual(result.value!, true)
		XCTAssertNil(result.error)
	}
	
	func testInitWithError() {
		let result = Result {
			throw TestError.test
		}
		
		XCTAssertNotNil(result)
		XCTAssertNil(result.value)
		XCTAssertNotNil(result.error)
	}

	// MARK: Functons tests
	
	func testDematerializeValue() {
		let result = Result {
			return true
		}
		
		do {
			let value = try result.dematerialize()
			
			XCTAssertEqual(value, true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}
	
	func testDematerializeError() {
		let result = Result {
			throw TestError.test
		}
		
		do {
			try result.dematerialize()
		}
		catch TestError.test {
			XCTAssert(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

}
