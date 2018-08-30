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
		let decomposition = getRGBCode(fromColor: color)
		
		XCTAssertNotNil(color)
		XCTAssertEqual(decomposition?.hex, 0xffffff)
		XCTAssertEqual(decomposition?.alpha, 1.0)
	}
	
	func testInitWithRGBCodeAndAlpha() {
		let color = UIColor(rgbCode: 0x000000, alpha: 0.5)
		let decomposition = getRGBCode(fromColor: color)
		
		XCTAssertNotNil(color)
		XCTAssertEqual(decomposition?.hex, 0x000000)
		XCTAssertEqual(decomposition?.alpha, 0.5)
	}
	
	func testInitWithRightRGBNumbers() {
		let color = UIColor(redNumber: 255, greenNumber: 255, blueNumber: 255)
		let decomposition = getRGBNumbers(fromColor: color)
		
		XCTAssertNotNil(color)
		XCTAssertEqual(decomposition?.red, 255)
		XCTAssertEqual(decomposition?.green, 255)
		XCTAssertEqual(decomposition?.blue, 255)
		XCTAssertEqual(decomposition?.alpha, 1.0)
	}
	
	func testInitWithRightRGBNumbersAndAlpha() {
		let color = UIColor(redNumber: 50, greenNumber: 100, blueNumber: 150, alpha: 0.5)
		let decomposition = getRGBNumbers(fromColor: color)
		
		XCTAssertNotNil(color)
		XCTAssertEqual(decomposition?.red, 50)
		XCTAssertEqual(decomposition?.green, 100)
		XCTAssertEqual(decomposition?.blue, 150)
		XCTAssertEqual(decomposition?.alpha, 0.5)
	}
	
	func testInitWithWrongRGBNumbers() {
		let color = UIColor(redNumber: 300, greenNumber: -200, blueNumber: 100)
		let decomposition = getRGBNumbers(fromColor: color)
		
		XCTAssertNotNil(color)
		XCTAssertEqual(decomposition?.red, 255)
		XCTAssertEqual(decomposition?.green, 0)
		XCTAssertEqual(decomposition?.blue, 100)
		XCTAssertEqual(decomposition?.alpha, 1.0)
	}
	
	// MARK: Helpers
	
	private func getRGBCode(fromColor color: UIColor) -> (hex: Int, alpha: CGFloat)? {
		guard let decomposition = getRGBNumbers(fromColor: color) else {
			return nil
		}
		
		return ((decomposition.red << 16) + (decomposition.green << 8) + decomposition.blue, decomposition.alpha)
	}
	
	private func getRGBNumbers(fromColor color: UIColor) -> (red: Int, green: Int, blue: Int, alpha: CGFloat)? {
		var redFloat = CGFloat(0)
		var greenFloat = CGFloat(0)
		var blueFloat = CGFloat(0)
		var alphaFloat = CGFloat(0)
		
		guard color.getRed(&redFloat, green: &greenFloat, blue: &blueFloat, alpha: &alphaFloat) else {
			return nil
		}
		
		return (Int(redFloat * 255.0), Int(greenFloat * 255.0), Int(blueFloat * 255.0), alphaFloat)
	}

}
