//
//  NetworkStatusTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest
import SystemConfiguration

@testable import Kashmir

class NetworkStatusTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Initializations tests

    func testInitWithNotReachableFlags() {
        let flags = SCNetworkReachabilityFlags(rawValue: 0)
        let status = Network.Status(flags: flags)
        
        XCTAssertNotNil(flags)
        XCTAssertEqual(status, Network.Status.notReachable)
    }
    
    func testInitWithReachableViaWiFiFlags() {
        let flags = SCNetworkReachabilityFlags(rawValue: 2)
        let status = Network.Status(flags: flags)
        
        XCTAssertNotNil(flags)
        XCTAssertEqual(status, Network.Status.reachable(.wifi))
    }
    
    func testInitWithReachableViaWWANFlags() {
        #if os(iOS)
            let flags = SCNetworkReachabilityFlags(rawValue: 6)
            let status = Network.Status(flags: flags)
            
            XCTAssertNotNil(flags)
            XCTAssertEqual(status, Network.Status.reachable(.wwan))
        #endif
    }
    
    func testInitWithReachableViaAnyDeviceFlags() {
        #if os(macOS)
            let flags = SCNetworkReachabilityFlags(rawValue: 6)
            let status = Network.Status(flags: flags)
            
            XCTAssertNotNil(flags)
            XCTAssertEqual(status, Network.Status.reachable(.any))
        #endif
    }
    
    // MARK: Equatable tests
    
    func testEqual() {
        let flags = SCNetworkReachabilityFlags(rawValue: 2)
        let status = Network.Status(flags: flags)
        
        XCTAssertTrue(status == Network.Status.reachable(.wifi))
    }
    
    func testNotEqual() {
        let flags = SCNetworkReachabilityFlags(rawValue: 2)
        let status = Network.Status(flags: flags)
        
        XCTAssertTrue(status != Network.Status.notReachable)
    }
}
