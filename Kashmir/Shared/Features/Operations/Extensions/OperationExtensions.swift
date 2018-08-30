//
//  OperationExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 24/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

extension Operation {

	// MARK: Functions
	
	/**
	Add multiple operations as dependencies at once.
	
	- parameter operations: An array of `Operation` objects on which the receiver should depend. 
	- note: A dependency should not be added more than once to the receiver, and the results of doing so are undefined.
	*/
	public func add(dependencies operations: [Operation]) {
		operations.forEach {
			addDependency($0)
		}
	}
	
}
