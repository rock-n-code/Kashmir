//
//  DateFormatterExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/04/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class DateFormatterExtensionsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}

	// MARK: Static tests
	
	func testUTC() {
		let dateFormatter = DateFormatter.utc
		
		XCTAssertNotNil(dateFormatter)
		XCTAssertEqual(dateFormatter.locale, Locale.current)
		XCTAssertEqual(dateFormatter.timeZone, TimeZone(identifier: "GMT"))
	}
	
	func testLocal() {
		let dateFormatter = DateFormatter.local
		
		XCTAssertNotNil(dateFormatter)
		XCTAssertEqual(dateFormatter.locale, Locale.current)
		XCTAssertEqual(dateFormatter.timeZone, TimeZone.current)
	}
	
}
