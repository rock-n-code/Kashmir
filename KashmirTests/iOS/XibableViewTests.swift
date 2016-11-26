//
//  XibableViewTests.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 16/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class TestView: XibableView {}

// MARK: -

class XibableViewTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Initializations tests

    func testInitWithFrame() {
        let view = TestView(frame: .zero)
        
        XCTAssertNotNil(view)
        XCTAssertEqual(view.frame, .zero)
        XCTAssertGreaterThan(view.subviews.count, 0)
    }
    
}
