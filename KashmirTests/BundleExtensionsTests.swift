//
//  BundleExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 26/08/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class BundleExtensionsTests: XCTestCase {

	// MARK: - Setup

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: - Functions tests

	func testUrlForResource() {
		let url = Bundle.url(forResource: "Test")

		XCTAssertNotNil(url)
	}

	func testUrlForResourceWithExtension() {
		let url = Bundle.url(forResource: "Info", withExtension: "plist")

		XCTAssertNotNil(url)
	}

	func testEmptyUrlForResourceWithExtension() {
		let url = Bundle.url(forResource: "Info")

		XCTAssertNil(url)
	}

}
