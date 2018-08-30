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

	// MARK: Setup

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Functions tests

	func testUrlForResource() {
		let url = Bundle.url(for: "Test")

		XCTAssertNotNil(url)
	}

	func testUrlForResourceWithExtension() {
		let url = Bundle.url(for: "Info", with: "plist")

		XCTAssertNotNil(url)
	}

	func testEmptyUrlForResourceWithExtension() {
		let url = Bundle.url(for: "Info")

		XCTAssertNil(url)
	}

	func testUrlsForResource() {
		let urls = Bundle.urls(for: "Test")

		XCTAssertNotNil(urls)
		XCTAssertEqual(urls.count, 1)
	}

	func testUrlsForResourceWithExtension() {
		let urls = Bundle.urls(for: "Info", with: "plist")

		XCTAssertNotNil(urls)
		XCTAssertGreaterThan(urls.count, 0)
	}

	func testEmptyUrlsForResource() {
		let urls = Bundle.urls(for: "Info")

		XCTAssertNotNil(urls)
		XCTAssertEqual(urls.count, 0)
	}

	// MARK: Performance tests

	func testUrlForResourcePerformance() {
		measure {
			self.testUrlForResource()
		}
	}

	func testUrlForResourceWithExtensionPerformance() {
		measure {
			self.testUrlForResourceWithExtension()
		}
	}

	func testUrlsForResourcePerformance() {
		measure {
			self.testUrlsForResource()
		}
	}

	func testUrlsForResourceWithExtensionPerformance() {
		measure {
			self.testUrlsForResourceWithExtension()
		}
	}

}
