//
//  OperationQueueExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 21/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

extension OperationQueue {

	// MARK: Initializers
	
	/**
	Creates a new queue.
	
	- parameters:
		- name: Custom queue name.
		- maxConcurrentOperationCount: The max concurrent operation count.
		- qualityOfService: The default service level to apply to operations executed using the queue.
	*/
	public convenience init(name: String,
	                        maxConcurrentOperationCount: Int = OperationQueue.defaultMaxConcurrentOperationCount,
	                        qualityOfService: QualityOfService = .default)
	{
		self.init()

		self.name = name
		self.maxConcurrentOperationCount = maxConcurrentOperationCount
		self.qualityOfService = qualityOfService
	}

	// MARK: Functions
	
	/**
	Add multiple operations to the queue at once.
	
	- parameter operations: An array of `Operation` objects that you want to add to the queue.
	- note: The operations are added to the queue and control returns immediately to the caller.
	*/
	public func add(_ operations: [Operation]) {
		addOperations(operations, waitUntilFinished: false)
	}
	
	/// Pause the queue.
	public func pause() {
		isSuspended = true
		
		operations.forEach {
			if let operation = $0 as? ConcurrentOperation {
				operation.pause()
			}
		}
	}
	
	/// Resume the queue.
	public func resume() {
		isSuspended = false
		
		operations.forEach {
			if let operation = $0 as? ConcurrentOperation {
				operation.resume()
			}
		}
	}
	
}
