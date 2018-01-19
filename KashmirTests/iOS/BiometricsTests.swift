//
//  BiometricsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 18/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class BiometricsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Properties tests
	
	func testSupportedTypes() {
		XCTAssertGreaterThan(Biometrics.manager.supportedTypes.count, 0)
	}
	
	func testSupportedType() {
		XCTAssertEqual(Biometrics.manager.supportedType, .touchID)
	}
	
	func testIsSupported() {
		XCTAssertFalse(Biometrics.manager.isSupported)
	}
	
	// MARK: Static tests
	
	func testManager() {
		XCTAssertNotNil(Biometrics.manager)
	}
	
	// MARK: Functions tests
	
	func testAuthenticate() {
		let expectation = self.expectation(description: "Biometric authentication test")

		Biometrics.manager.authenticate { error in
			XCTAssertNotNil(error)
			
			switch error! {
			case BiometricError.notSupported:
				XCTAssertTrue(true)
			default:
				XCTFail("Unexpected error")
			}

			expectation.fulfill()
		}
		
		waitForExpectations(timeout: 15.0) { error in
			guard error != nil else {
				return
			}
			
			XCTFail("Unexpected error")
		}
	}

}

