//
//  DataStackTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 02/08/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import XCTest

@testable import Kashmir

class DataStackTests: XCTestCase {

	// MARK: Constants

	let manager = DataStack.manager
	let modelName = "Test"

	// MARK: Setup

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

	// MARK: Properties tests

	func testManager() {
		XCTAssertNotNil(DataStack.manager)
	}

	// MARK: Initialisation tests

	func testInit() {
		let instance = DataStack()

		XCTAssertNotNil(instance)
		XCTAssertNotNil(instance.containers)
		XCTAssertTrue(instance.containers.isEmpty)
	}

	// MARK: Functions tests

	func testAddModelOfTypeSQL() {
		do {
			try manager.add(modelName)

			XCTAssertTrue(manager.containers.keys.contains(modelName))
			XCTAssertNotNil(manager.containers[modelName])

			try manager.remove(modelName)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}
	
	func testAddModelOfTypeInMemory() {
		do {
			try manager.add(modelName, of: .inMemory)
			
			XCTAssertTrue(manager.containers.keys.contains(modelName))
			XCTAssertNotNil(manager.containers[modelName])
			
			try manager.remove(modelName)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testAddEmptyModelName() {
		do {
			try manager.add("")
		}
		catch DataStackError.containerNameIsEmpty {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testAddNotExistingModelName() {
		do {
			try manager.add("xxx")
		} catch DataStackError.objectModelNotFound {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testAddAlreadyExistsModelName() {
		defer {
			try! manager.remove(modelName)
		}
		
		do {
			try manager.add(modelName)
			try manager.add(modelName)
		}
		catch DataStackError.containerNameExists {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testRemoveModelName() {
		do {
			try manager.add(modelName)
			try manager.remove(modelName)

			XCTAssertFalse(manager.containers.keys.contains(modelName))
			XCTAssertNil(manager.containers[modelName])
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testRemoveEmptyModelName() {
		do {
			try manager.remove("")
		}
		catch DataStackError.containerNameIsEmpty {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testRemoveRemovedModelName() {
		do {
			try manager.add(modelName)
			try manager.remove(modelName)
			try manager.remove(modelName)
		}
		catch DataStackError.containerNameNotExists {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testForeContextOfModelName() {
		do {
			try manager.add(modelName)
			let context = try manager.foreContext(of: modelName)

			XCTAssertNotNil(context)

			try manager.remove(modelName)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testForeContextOfEmptyModelName() {
		do {
			_ = try manager.foreContext(of: "")
		}
		catch DataStackError.containerNameIsEmpty {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testForeContextOfNotExistingModelName() {
		do {
			_ = try manager.foreContext(of: "xxx")
		}
		catch DataStackError.containerNameNotExists {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testBackContextOfModelName() {
		do {
			try manager.add(modelName)

			let context = try manager.backContext(of: modelName)

			XCTAssertNotNil(context)

			try manager.remove(modelName)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testBackContextOfEmptyModelName() {
		do {
			_ = try manager.backContext(of: "")
		}
		catch DataStackError.containerNameIsEmpty {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testBackContextOfNotExistingModelName() {
		do {
			_ = try manager.backContext(of: "xxx")
		}
		catch DataStackError.containerNameNotExists {
			XCTAssertTrue(true)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	func testSave() {
		do {
			try manager.add(modelName)

			let context = try manager.foreContext(of: modelName)
			let testing = Testing(context: context)
			let request = Testing.fetchRequest() as NSFetchRequest<Testing>

			testing.date = Date()

			try manager.save()

			let savedTestings = try context.fetch(request)

			XCTAssertEqual(savedTestings.count, 1)
			
			try manager.remove(modelName)
		}
		catch {
			XCTFail("Unexpected error")
		}
	}

	// MARK: Performance tests
    
    func testManagerPerformance() {
        measure {
            self.testManager()
        }
    }

	func testInitPerformance() {
		measure {
			self.testInit()
		}
	}

	func testAddModelOfTypeSQLPerformance() {
		measure {
			self.testAddModelOfTypeSQL()
		}
	}

	func testRemoveModelNamePerformance() {
		measure {
			self.testRemoveModelName()
		}
	}

	func testForeContextOfModelNamePerformance() {
		measure {
			self.testForeContextOfModelName()
		}
	}

	func testBackContextOfModelNamePerformance() {
		measure {
			self.testBackContextOfModelName()
		}
	}

	func testSavePerformance() {
		measure {
			self.testSave()
		}
	}
    
}
