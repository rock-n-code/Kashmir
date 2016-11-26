//
//  IndexPathExtensionsTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 26/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class IndexPathExtensionsTests: XCTestCase {
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Properties tests
    
    func testPreviousSection() {
        let indexPath = IndexPath(item: 5, section: 2)
        let previousIndexPath = indexPath.previousSection
        
        XCTAssertNotNil(previousIndexPath)
        XCTAssertEqual(previousIndexPath!.section, 1)
    }
    
    func testPreviousSectionOnIndexPathWithFirstSection() {
        let indexPath = IndexPath(item: 2, section: 0)
        let previousIndexPath = indexPath.previousSection
        
        XCTAssertNil(previousIndexPath)
    }
    
    func testPreviousSectionOnFirstIndexPath() {
        let indexPath = IndexPath(item: 0, section: 0)
        let previousIndexPath = indexPath.previousSection
        
        XCTAssertNil(previousIndexPath)
    }
    
    func testPreviousItem() {
        let indexPath = IndexPath(item: 4, section: 1)
        let previousIndexPath = indexPath.previousItem
        
        XCTAssertNotNil(previousIndexPath)
        XCTAssertEqual(previousIndexPath!.item, 3)
    }
    
    func testPreviousItemOnIndexPathWithMultipleSections() {
        let indexPath = IndexPath(item: 0, section: 1)
        let previousIndexPath = indexPath.previousItem
        
        XCTAssertNil(previousIndexPath)
    }
    
    func testPreviousItemOnFirstIndexPath() {
        let indexPath = IndexPath(item: 0, section: 0)
        let previousIndexPath = indexPath.previousItem
        
        XCTAssertNil(previousIndexPath)
    }
    
    func testNextSection() {
        let indexPath = IndexPath(item: 5, section: 2)
        let nextIndexPath = indexPath.nextSection
        
        XCTAssertNotNil(nextIndexPath)
        XCTAssertEqual(nextIndexPath.section, 3)
    }
    
    func testNextItem() {
        let indexPath = IndexPath(item: 4, section: 1)
        let nextIndexPath = indexPath.nextItem
        
        XCTAssertNotNil(nextIndexPath)
        XCTAssertEqual(nextIndexPath.item, 5)
    }

}
