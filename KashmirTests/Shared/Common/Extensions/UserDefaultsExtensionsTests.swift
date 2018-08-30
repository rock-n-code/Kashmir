//
//  UserDefaultsExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 15/02/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation

@testable import Kashmir

class UserDefaultsExtensionsTests: XCTestCase {
	
	// MARK: Constants
	
	let defaults = UserDefaults.standard
	let testKey = "test"
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Functions tests

	func testSetFullyDefinedCoder() {
		let test = TestCoder()

		test.title = "Test title"
		test.value = 100
		test.list = ["Test #1", "Test #2", "Test #3"]
		
		defaults.set(test, forKey: testKey)
		defaults.synchronize()
		
		guard let testCoded = defaults.decode(forKey: testKey) as? TestCoder else {
			XCTFail("Unexpected error")
			return
		}
		
		XCTAssertNotNil(test)
		XCTAssertNotNil(testCoded)
		XCTAssert(test == testCoded)
		
		defaults.removeObject(forKey: testKey)
		defaults.synchronize()
	}
	
	func testSetPartiallyDefinedCoder() {
		let test = TestCoder()
		
		test.value = 100
		
		defaults.set(test, forKey: testKey)
		defaults.synchronize()
		
		guard let testCoded = defaults.decode(forKey: testKey) as? TestCoder else {
			XCTFail("Unexpected error")
			return
		}
		
		XCTAssertNotNil(test)
		XCTAssertNotNil(testCoded)
		XCTAssert(test == testCoded)
		
		defaults.removeObject(forKey: testKey)
		defaults.synchronize()
	}
	
	func testSetEmptyCoder() {
		let test = TestCoder()

		defaults.set(test, forKey: testKey)
		defaults.synchronize()
		
		guard let testCoded = defaults.decode(forKey: testKey) as? TestCoder else {
			XCTFail("Unexpected error")
			return
		}
		
		XCTAssertNotNil(test)
		XCTAssertNotNil(testCoded)
		XCTAssert(test == testCoded)

		defaults.removeObject(forKey: testKey)
		defaults.synchronize()
	}
	
	func testDecodeKeyWithEmptyValue() {
		XCTAssertNil(defaults.decode(forKey: testKey))
	}

}

// MARK: - TestObject

class TestCoder: NSObject, NSCoding {
	
	// MARK: Properties
	
	var title: String?
	var value: Int?
	var list: [String]?

	// MARK: Initializers

	override init() {}

	// MARK: NSCoding
	
	required convenience init?(coder aDecoder: NSCoder) {
		self.init()
		self.title = aDecoder.decodeObject(forKey: "title") as? String
		self.value = aDecoder.decodeObject(forKey: "value") as? Int
		self.list = aDecoder.decodeObject(forKey: "list") as? [String]
	}
	
	func encode(with coder: NSCoder) {
		coder.encode(title, forKey: "title")
		coder.encode(value, forKey: "value")
		coder.encode(list, forKey: "list")
	}
	
	// MARK: Equatable
	
	static func == (lhs: TestCoder, rhs: TestCoder) -> Bool {
		return (lhs.title ?? "") == (rhs.title ?? "") &&
			(lhs.value ?? 0) == (rhs.value ?? 0) &&
			(lhs.list ?? []) == (rhs.list ?? [])
	}
	
}
