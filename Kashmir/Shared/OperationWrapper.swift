//
//  OperationWrapper.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

protocol OperationWrapper {

	// MARK: Events
	
	var onStarted: ExecutionBlock? { get set }
	var onFinished: ExecutionBlock? { get set }
	var onError: ErrorBlock? { get set }
	
	
	// MARK: Properties
	
	var name: String { get }
	
	// MARK: Functions
	
	func run()
	
}
