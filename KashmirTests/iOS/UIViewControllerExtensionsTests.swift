//
//  UIViewControllerExtensionsTests.swift
//  KashmirTests_iOS
//
//  Created by Javier Cicchelli on 19/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest
import UIKit

@testable import Kashmir

class TestViewController: UIViewController {}

class ChildViewController: UIViewController {}

// MARK: -

class UIViewControllerExtensionsTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() { 
		super.tearDown()
	}
	
	// MARK: Functions tests
	
	func testAddChildViewControllerToView() {
		let testViewController = TestViewController()
		let childViewController = ChildViewController()
		
		XCTAssertEqual(testViewController.childViewControllers.count, 0)
		
		testViewController.addChild(viewController: childViewController,
									to: testViewController.view)
		
		XCTAssertEqual(testViewController.childViewControllers.count, 1)
	}
	
	func testRemoveChildViewControllerFromView() {
		let testViewController = TestViewController()
		let childViewController = ChildViewController()
		
		testViewController.addChild(viewController: childViewController,
									to: testViewController.view)
		
		XCTAssertEqual(testViewController.childViewControllers.count, 1)
		
		testViewController.removeChild(viewController: childViewController,
									   from: testViewController.view)
		
		XCTAssertEqual(testViewController.childViewControllers.count, 0)
	}
	
}
