//
//  UIDeviceExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 31/10/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class UIDeviceExtensionsTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Properties tests
    
    func testVersion() {
        XCTAssertEqual(UIDevice.current.version, 10.3)
    }
    
    func testIsPortrait() {
        XCTAssertFalse(UIDevice.current.isPortrait)
    }
    
    func testIsLandscape() {
        XCTAssertFalse(UIDevice.current.isLandscape)
    }
    
}
