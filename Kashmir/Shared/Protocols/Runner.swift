//
//  Runner.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 29/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Foundation

public protocol Runner: class {
	
	// MARK: Associated types
	
	associatedtype Value
	
	// MARK: Types
	
	typealias RunnerExecutionBlock = (Result<Value>) -> ()
	
	// MARK: Properties
	
	var queue: OperationQueue? { get set }
	
	// MARK: Functions
	
	func run(then completion: RunnerExecutionBlock?)
	
}
