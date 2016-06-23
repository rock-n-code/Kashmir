//
//  URLRequestMethodTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class URLRequestMethodTests: XCTestCase {

	// MARK: - Setup

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: - Properties tests

	func testRawValue() {
		XCTAssertEqual(URLRequest.Method.get.rawValue, "GET")
		XCTAssertEqual(URLRequest.Method.head.rawValue, "HEAD")
		XCTAssertEqual(URLRequest.Method.post.rawValue, "POST")
		XCTAssertEqual(URLRequest.Method.put.rawValue, "PUT")
		XCTAssertEqual(URLRequest.Method.delete.rawValue, "DELETE")
		XCTAssertEqual(URLRequest.Method.connect.rawValue, "CONNECT")
		XCTAssertEqual(URLRequest.Method.options.rawValue, "OPTIONS")
		XCTAssertEqual(URLRequest.Method.trace.rawValue, "TRACE")
	}

}
