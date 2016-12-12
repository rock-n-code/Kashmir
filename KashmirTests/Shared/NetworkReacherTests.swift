//
//  NetworkReacherTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 30/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest
import SystemConfiguration

@testable import Kashmir

class NetworkReacherTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Initializations tests
    
    func testInitWithHost() {
        guard let reacher = Network.Reacher(host: "rock-n-code.com") else {
            XCTFail("Unexpected error")
            return
        }
        
        XCTAssertNotNil(reacher)
        XCTAssertNotNil(reacher.reference)
        XCTAssertNil(reacher.queue)
        XCTAssertFalse(reacher.isObserving)
    }
    
    func testInitWithEmptyHost() {
        let reacher = Network.Reacher(host: "")
        
        XCTAssertNil(reacher)
    }
    
    func testInitWithNonUTF8Host() {
        XCTFail("Test case not implemented yet.")
    }
    
    func testInitWithIPv4Address() {
        let ipV4Address = makeIPv4Address()

        guard let reacher = Network.Reacher(address: ipV4Address) else {
            XCTFail("Unexpected error")
            return
        }
        
        XCTAssertNotNil(reacher)
        XCTAssertNotNil(reacher.reference)
        XCTAssertNil(reacher.queue)
        XCTAssertFalse(reacher.isObserving)
    }
    
    func testInitWithUndefinedIP4Address() {
        let reacher = Network.Reacher(address: sockaddr_in())
        
        XCTAssertNil(reacher)
    }
    
    func testInitWithIPv6Address() {
        let ipV6Address = makeIPv6Address()
        
        guard let reacher = Network.Reacher(address: ipV6Address) else {
            XCTFail("Unexpected error")
            return
        }
        
        XCTAssertNotNil(reacher)
        XCTAssertNotNil(reacher.reference)
        XCTAssertNil(reacher.queue)
        XCTAssertFalse(reacher.isObserving)
    }
    
    func testInitWithUndefinedIP6Address() {
        let reacher = Network.Reacher(address: sockaddr_in6())
        
        XCTAssertNil(reacher)
    }
    
    // MARK: Functions tests
    
    func testConnectivityWithHost() {
        guard let reacher = Network.Reacher(host: "rock-n-code.com") else {
            XCTFail("Unexpected error.")
            return
        }
        
        do {
            let status = try reacher.connectivity()
            
            XCTAssertNotNil(status)
            XCTAssertTrue(status == .reachable(.wifi))
        }
        catch {
            XCTFail("Unexpected error.")
        }
    }
    
    func testConnectivityWithIPv4Address() {
        let ipV4Address = makeIPv4Address()

        guard let reacher = Network.Reacher(address: ipV4Address) else {
            XCTFail("Unexpected error")
            return
        }
        
        do {
            let status = try reacher.connectivity()
            
            XCTAssertNotNil(status)
            XCTAssertTrue(status == .reachable(.wifi))
        }
        catch {
            XCTFail("Unexpected error.")
        }
    }
    
    func testConnectivityWithIPv6Address() {
        let ipV6Address = makeIPv4Address()
        
        guard let reacher = Network.Reacher(address: ipV6Address) else {
            XCTFail("Unexpected error")
            return
        }
        
        do {
            let status = try reacher.connectivity()
            
            XCTAssertNotNil(status)
            XCTAssertTrue(status == .reachable(.wifi))
        }
        catch {
            XCTFail("Unexpected error.")
        }
    }
    
    func testObserveWithHost() {
        let expectation = self.expectation(description: "Reacher observe test with hostname")
        
        guard let reacher = Network.Reacher(host: "rock-n-code.com") else {
            XCTFail("Unexpected error.")
            return
        }
        
        defer {
            try! reacher.unobserve()
        }
        
        do {
            try reacher.observe()
            
            reacher.onStatusChanged = { status in
                XCTAssertNotNil(status)
                
                expectation.fulfill()
            }
            
            XCTAssertNotNil(reacher.queue)
            XCTAssertTrue(reacher.isObserving)
        }
        catch {
            XCTFail("Unexpected error.")
        }
       
        waitForExpectations(timeout: 30.0) { error in
            guard error != nil else {
                return
            }

            XCTFail("Unexpected error.")
        }
    }
    
    func testObserveWithIPv4Address() {
        let expectation = self.expectation(description: "Reacher observe test with IP v4 address")
        
        guard let reacher = Network.Reacher(address: makeIPv4Address()) else {
            XCTFail("Unexpected error.")
            return
        }
        
        defer {
            try! reacher.unobserve()
        }
        
        do {
            try reacher.observe()
            
            reacher.onStatusChanged = { status in
                XCTAssertNotNil(status)
                
                expectation.fulfill()
            }
            
            XCTAssertNotNil(reacher.queue)
            XCTAssertTrue(reacher.isObserving)
        }
        catch {
            XCTFail("Unexpected error.")
        }
        
        waitForExpectations(timeout: 30.0) { error in
            guard error != nil else {
                return
            }
            
            XCTFail("Unexpected error.")
        }
    }
    
    func testObserveWithIPv6Address() {
        let expectation = self.expectation(description: "Reacher observe test with IP v6 address")
        
        guard let reacher = Network.Reacher(address: makeIPv6Address()) else {
            XCTFail("Unexpected error.")
            return
        }
        
        defer {
            try! reacher.unobserve()
        }
        
        do {
            try reacher.observe()
            
            reacher.onStatusChanged = { status in
                XCTAssertNotNil(status)
                
                expectation.fulfill()
            }
            
            XCTAssertNotNil(reacher.queue)
            XCTAssertTrue(reacher.isObserving)
        }
        catch {
            XCTFail("Unexpected error.")
        }
        
        waitForExpectations(timeout: 30.0) { error in
            guard error != nil else {
                return
            }
            
            XCTFail("Unexpected error.")
        }
    }
    
    func testUnobserveWithHost() {
        guard let reacher = Network.Reacher(host: "rock-n-code.com") else {
            XCTFail("Unexpected error.")
            return
        }

        do {
            try reacher.observe()
            try reacher.unobserve()

            XCTAssertNil(reacher.queue)
            XCTAssertFalse(reacher.isObserving)
        }
        catch {
            XCTFail("Unexpected error.")
        }
    }
    
    func testUnobserveWithIPv4Address() {
        guard let reacher = Network.Reacher(address: makeIPv4Address()) else {
            XCTFail("Unexpected error.")
            return
        }
        
        do {
            try reacher.observe()
            try reacher.unobserve()
            
            XCTAssertNil(reacher.queue)
            XCTAssertFalse(reacher.isObserving)
        }
        catch {
            XCTFail("Unexpected error.")
        }
    }
    
    func testUnobserveWithIPv6Address() {
        guard let reacher = Network.Reacher(address: makeIPv6Address()) else {
            XCTFail("Unexpected error.")
            return
        }
        
        do {
            try reacher.observe()
            try reacher.unobserve()
            
            XCTAssertNil(reacher.queue)
            XCTAssertFalse(reacher.isObserving)
        }
        catch {
            XCTFail("Unexpected error.")
        }
    }
    
    // MARK: Helpers
    
    private func makeIPv4Address() -> sockaddr_in {
        var address = sockaddr_in()
        
        address.sin_len = UInt8(MemoryLayout.size(ofValue: address))
        address.sin_family = sa_family_t(AF_INET)
        
        return address
    }
    
    func makeIPv6Address() -> sockaddr_in6 {
        var address = sockaddr_in6()
        
        address.sin6_len = UInt8(MemoryLayout.size(ofValue: address))
        address.sin6_family = sa_family_t(AF_INET)
        
        return address
    }

}
