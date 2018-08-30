//
//  SCNetworkReachabilityFlagsExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 29/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest
import SystemConfiguration

@testable import Kashmir

class SCNetworkReachabilityFlagsExtensionsTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Properties tests

    func testIsReachable() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1)

        XCTAssertTrue(flags.isReachable)
    }
    
    func testIsNotReachable() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0)

        XCTAssertFalse(flags.isReachable)
    }
    
    func testIsConnectionRequired() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 2)
        
        XCTAssertTrue(flags.isConnectionRequired)
    }
    
    func testIsConnectionNotRequired() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0 + 1 << 1)
        
        XCTAssertFalse(flags.isConnectionRequired)
    }
    
    func testIsInterventionRequired() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 4)
        
        XCTAssertTrue(flags.isInterventionRequired)
    }
    
    func testIsInterventionNotRequired() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 2 + 1 << 3)
        
        XCTAssertFalse(flags.isInterventionRequired)
    }

    func testIsConnectionOnTraffic() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 3)
        
        XCTAssertTrue(flags.isConnectionOnTraffic)
    }
    
    func testIsConnectionNotOnTraffic() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1 + 1 << 2)
        
        XCTAssertFalse(flags.isConnectionOnTraffic)
    }
    
    func testIsConnectionOnDemand() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 5)
        
        XCTAssertTrue(flags.isConnectionOnDemand)
    }
    
    func testIsConnectionNotOnDemand() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 3 + 1 << 4)
        
        XCTAssertFalse(flags.isConnectionOnDemand)
    }
    
    func testIsTransientConnection() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0)
        
        XCTAssertTrue(flags.isTransientConnection)
    }
    
    func testIsNotTransientConnection() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1 + 1 << 2)
        
        XCTAssertFalse(flags.isTransientConnection)
    }
    
    func testIsALocalAddress() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 16)
        
        XCTAssertTrue(flags.isALocalAddress)
    }
    
    func testIsNotALocalAddress() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 15 + 1 << 17)
        
        XCTAssertFalse(flags.isALocalAddress)
    }
    
    func testIsConnectionAutomatic() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 3)
        
        #if os(iOS)
            XCTAssertTrue(flags.isConnectionAutomatic)
        #else
            XCTAssertFalse(flags.isConnectionAutomatic)
        #endif
    }
    
    func testIsNotConnectionAutomatic() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 2 + 1 << 4)
        
        XCTAssertFalse(flags.isConnectionAutomatic)
    }

    func testIsDirectConnection() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 17)
        
        XCTAssertTrue(flags.isDirectConnection)
    }
    
    func testIsNotDirectConnection() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 16 + 1 << 18)
        
        XCTAssertFalse(flags.isDirectConnection)
    }

    func testIsConnectionOnTrafficOrDemand() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 3 + 1 << 5)
        
        XCTAssertTrue(flags.isConnectionOnTrafficOrDemand)
    }
    
    func testIsNotConnectionOnTrafficNorDemand() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0 + 1 << 4)
        
        XCTAssertFalse(flags.isConnectionOnTrafficOrDemand)
    }
    
    func testIsConnectionRequiredOrTransient() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0 + 1 << 2)
        
        XCTAssertTrue(flags.isConnectionRequiredOrTransient)
    }
    
    func testIsNotConnectionRequiredNorTransient() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1 + 1 << 5)
        
        XCTAssertFalse(flags.isConnectionRequiredOrTransient)
    }
    
    func testIsConnected() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1)
        
        XCTAssertTrue(flags.isConnected)
    }
    
    func testIsNotConnected() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0)
        
        XCTAssertFalse(flags.isConnected)
    }
    
    func testIsOnWWAN() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 18)
        
        #if os(iOS)
            XCTAssertTrue(flags.isOnWWAN)
        #else
            XCTAssertFalse(flags.isOnWWAN)
        #endif
    }
    
    func testIsNotOnWWAN() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 17)
        
        XCTAssertFalse(flags.isOnWWAN)
    }
    
    func testIsReachableViaWWAN() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1 + 1 << 18)
        
        XCTAssertTrue(flags.isReachableViaWWAN)
    }
    
    func testIsNotReachableViaWWAN() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0 + 1 << 18)
        
        XCTAssertFalse(flags.isReachableViaWWAN)
    }
    
    func testIsReachableViaWiFi() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1)
        
        XCTAssertTrue(flags.isReachableViaWiFi)
    }
    
    func testIsNotReachableViaWiFi() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0)
        
        XCTAssertFalse(flags.isReachableViaWiFi)
    }
    
    // MARK: - CustomStringConvertible tests
    
    func testDescriptionNoFlags() {
        let flags = SCNetworkReachabilityFlags(rawValue: 0)
        
        XCTAssertEqual(flags.description, "XX --------")
    }
    
    func testDescriptionIsTransientConnection() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 0)
        
        XCTAssertEqual(flags.description, "XX -t------")
    }
    
    func testDescriptionIsReachable() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 1)
        
        XCTAssertEqual(flags.description, "XX R-------")
    }
    
    func testDescriptionIsConnectionRequired() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 2)
        
        XCTAssertEqual(flags.description, "XX --c-----")
    }
    
    func testDescriptionIsConnectionOnTraffic() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 3)
        
        XCTAssertEqual(flags.description, "XX ---C----")
    }
    
    func testDescriptionIsInterventionRequired() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 4)
        
        XCTAssertEqual(flags.description, "XX ----i---")
    }
    
    func testDescriptionIsConnectionOnDemand() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 5)
        
        XCTAssertEqual(flags.description, "XX -----D--")
    }
    
    func testDescriptionIsALocalAddress() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 16)
        
        XCTAssertEqual(flags.description, "XX ------l-")
    }
    
    func testDescriptionIsDirectConnection() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 17)
        
        XCTAssertEqual(flags.description, "XX -------d")
    }
    
    func testDescriptionIsConnectionAutomatic() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 3)
        
        #if os(iOS)
            XCTAssertEqual(flags.description, "XA ---C---")
        #else
            XCTAssertEqual(flags.description, "XX ---C----")
        #endif
    }
    
    func testDescriptionIsOnWWAN() {
        let flags = SCNetworkReachabilityFlags(rawValue: 1 << 18)
        
        #if os(iOS)
            XCTAssertEqual(flags.description, "WX --------")
        #else
            XCTAssertEqual(flags.description, "XX --------")
        #endif
    }

}
