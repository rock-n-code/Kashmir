//
//  TimeZoneExtensionsTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 14/10/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest
import Foundation

@testable import Kashmir

class TimeZoneExtensionsTests: XCTestCase {

	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Initializers tests
	
	func testInitWithUTCDateString() {
		let timeZone = TimeZone(dateString: "2017-01-01T00:00:00.000Z")
		
		XCTAssertNotNil(timeZone)
		XCTAssertEqual(timeZone?.identifier, "GMT")
		XCTAssertEqual(timeZone?.secondsFromGMT(), 0)
	}
	
	func testInitWithNoOffsetDateString() {
		let timeZone = TimeZone(dateString: "2017-01-01T00:00:00.000+00:00")
		
		XCTAssertNotNil(timeZone)
		XCTAssertEqual(timeZone?.secondsFromGMT(), 0)
	}
	
	func testInitWithPositiveOffsetDateString() {
		let timeZone = TimeZone(dateString: "2017-01-01T00:00:00.000+02:00")
		
		XCTAssertNotNil(timeZone)
		XCTAssertEqual(timeZone?.secondsFromGMT(), 7200)
	}
	
	func testInitWithNegativeOffsetDateString() {
		let timeZone = TimeZone(dateString: "2017-01-01T00:00:00.000-04:00")
		
		XCTAssertNotNil(timeZone)
		XCTAssertEqual(timeZone?.secondsFromGMT(), -14400)
	}
	
	func testInitWithEmptyString() {
		let timeZone = TimeZone(dateString: "")
		
		XCTAssertNil(timeZone)
	}
	
	func testInitWithWrongDateString() {
		let timeZone = TimeZone(dateString: "2017-01-01T00:00:00.000")
		
		XCTAssertNil(timeZone)
	}

}
