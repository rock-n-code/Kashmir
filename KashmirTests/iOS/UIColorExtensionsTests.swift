//
//  UIColorExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 07/04/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class UIColorExtensionsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Static tests
	
	func testMakeRandom() {
		XCTAssertNotNil(UIColor.makeRandom())
	}
	
	func testMakeRandomWithAlpha() {
		XCTAssertNotNil(UIColor.makeRandom(withAlpha: 0.5))
	}
	
	// MARK: Initializers tests
	
	func testInitWithRGBCode() {
		let color = UIColor(rgbCode: 0xffffff)
		
		XCTAssertNotNil(color)
	}
	
	func testInitWithRGBCodeAndAlpha() {
		let color = UIColor(rgbCode: 0x000000, alpha: 0.5)
		
		XCTAssertNotNil(color)
	}
	
	func testInitWithRightRGBNumbers() {
		let color = UIColor(redNumber: 255, greenNumber: 255, blueNumber: 255)
		
		XCTAssertNotNil(color)
	}
	
	func testInitWithRightRGBNumbersAndAlpha() {
		let color = UIColor(redNumber: 50, greenNumber: 100, blueNumber: 150, alpha: 0.5)
		
		XCTAssertNotNil(color)
	}
	
	func testInitWithWrongRGBNumbers() {
		let color = UIColor(redNumber: 300, greenNumber: -200, blueNumber: 100)
		
		XCTAssertNotNil(color)
	}
	
}
