//
//  DataSourceTests.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 11/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class _DataSource: DataSource {

    typealias SourceData = [String]
    typealias Section = _Section
    typealias Item = _Item
    
    // MARK: Properties
    
    var data: [Section : [Item]]
    var sourceData: SourceData?

    // MARK: Initializers
    
    required init() {
        data = [:]
    }
    
    // MARK: Functions
    
    func load() {
        for index in 0 ..< sourceData!.count {
            let section = _Section(index: index, id: "\(index)")
            
            var items = [_Item]()
            
            for _ in 0 ..< 3 {
                items.append(_Item())
            }
            
            data[section] = items
        }
    }

}

// MARK: -

class DataSourceTests: XCTestCase {
    
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Initialization tests
    
    func testInit() {
        let dataSource = _DataSource()
        
        XCTAssertNotNil(dataSource)
        XCTAssertTrue(dataSource.data.isEmpty)
        XCTAssertEqual(dataSource.numberOfSections, 0)
        XCTAssertEqual(try! dataSource.numberOfItems(at: 0), 0)
        XCTAssertNil(dataSource.sourceData)
    }
    
    func testInitWithData() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        XCTAssertNotNil(dataSource.sourceData)
        XCTAssertGreaterThan(dataSource.numberOfSections, 0)
        XCTAssertGreaterThan(try dataSource.numberOfItems(at: 0), 0)
    }
    
    // MARK: Properties tests
    
    func testSourceData() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        XCTAssertNotNil(dataSource.sourceData)
    }
    
    func testSourceDataWithEmptyDataSource() {
        let dataSource = _DataSource()
        
        XCTAssertNil(dataSource.sourceData)
    }

    func testNumberOfSections() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        XCTAssertGreaterThan(dataSource.numberOfSections, 0)
    }
    
    func testNumberOfSectionsWithEmptyDataSource() {
        let dataSource = _DataSource()
        
        XCTAssertEqual(dataSource.numberOfSections, 0)
    }
    
    // MARK: Functions tests
    
    func testUpdate() {
        let dataSource = _DataSource()
        
        XCTAssertTrue(dataSource.data.isEmpty)
        
        dataSource.update(data: ["A", "B", "C"])
        
        XCTAssertFalse(dataSource.data.isEmpty)
    }
    
    func testNumberOfItemsAtSection() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            let numberOfItems = try dataSource.numberOfItems(at: 0)
            
            XCTAssertGreaterThan(numberOfItems, 0)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testNumberOfItemsAtNotExistingSection() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            _ = try dataSource.numberOfItems(at: 100)
        }
        catch DataSourceError.sectionIndexOutOfBounds {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testNumberOfItemsAtSectionWithEmptyDataSource() {
        let dataSource = _DataSource()
        
        do {
            let items = try dataSource.numberOfItems(at: 0)
            
            XCTAssertEqual(items, 0)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemsAtIndex() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            let items = try dataSource.items(at: 0)
            
            XCTAssertGreaterThan(items.count, 0)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemsAtNotExistingSection() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            _ = try dataSource.items(at: 100)
        }
        catch DataSourceError.sectionIndexOutOfBounds {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemsAtIndexWithEmptyDataSource() {
        let dataSource = _DataSource()
        
        do {
            _ = try dataSource.items(at: 0)
        }
        catch DataSourceError.itemsEmpty {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemsAtIndexPaths() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            let firstIndexPath = IndexPath(item: 0, section: 0)
            let secondIndexPath = IndexPath(item: 1, section: 0)
            
            let items = try dataSource.items(at: [firstIndexPath, secondIndexPath])
            
            XCTAssertGreaterThan(items.count, 0)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemsAtNotExistingIndexPaths() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            let firstIndexPath = IndexPath(item: 0, section: 0)
            let secondIndexPath = IndexPath(item: 10, section: 10)
            
            _ = try dataSource.items(at: [firstIndexPath, secondIndexPath])
        }
        catch DataSourceError.sectionIndexOutOfBounds {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemsAtIndexPathsWithEmptyDataSource() {
        let dataSource = _DataSource()
        
        do {
            let indexPath = IndexPath(item: 0, section: 0)
            
            _ = try dataSource.items(at: [indexPath])
        }
        catch DataSourceError.itemsEmpty {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testSectionAtIndex() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            let section = try dataSource.section(at: 0)
            
            XCTAssertNotNil(section)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testSectionAtOutOfBoundsIndex() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        
        do {
            _ = try dataSource.section(at: 100)
        }
        catch DataSourceError.sectionIndexOutOfBounds {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testSectionAtIndexWithEmptyDataSource() {
        let dataSource = _DataSource()
        
        do {
            _ = try dataSource.section(at: 0)
        }
        catch DataSourceError.sectionsEmpty {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemAtIndexPath() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        let indexPath = IndexPath(item: 0, section: 0)
        
        do {
            let item = try dataSource.item(at: indexPath)
            
            XCTAssertNotNil(item)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemAtIndexPathWithOutOfBoundsSection() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        let indexPath = IndexPath(item: 0, section: 100)
        
        do {
            _ = try dataSource.item(at: indexPath)
        }
        catch DataSourceError.sectionIndexOutOfBounds {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemAtIndexPathWithOutOfBoundsItem() {
        let dataSource = _DataSource(data: ["A", "B", "C"])
        let indexPath = IndexPath(item: 100, section: 0)
        
        do {
            _ = try dataSource.item(at: indexPath)
        }
        catch DataSourceError.itemIndexOutOfBounds {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testItemAtIndexPathWithEmptyDataSource() {
        let dataSource = _DataSource()
        
        do {
            _ = try dataSource.item(at: IndexPath(item: 0, section: 0))
        }
        catch DataSourceError.itemsEmpty {
            XCTAssertTrue(true)
        }
        catch {
            XCTFail("Unexpected error")
        }
    }

}
