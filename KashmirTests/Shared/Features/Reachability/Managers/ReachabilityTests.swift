//
//  ReachabilityTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 29/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class ReachabilityTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Static tests
    
    func testManager() {
        XCTAssertNotNil(Reachability.manager)
    }
    
    // MARK: Properties tests
    
    func testHaveInternetConnection() {
        XCTAssertTrue(Reachability.manager.haveInternetConnection)
    }
}
