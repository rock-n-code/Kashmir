//
//  OperationRunner.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 17/11/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

public protocol OperationRunner {
	
	// MARK: Properties
	
	var queue: OperationQueue { get set }
	
	// MARK: Functions
	
	func run()
	
}
