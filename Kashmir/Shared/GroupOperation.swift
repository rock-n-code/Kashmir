//
//  GroupOperation.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 14/11/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

/**
...
*/
open class GroupOperation: ConcurrentOperation {
	
	// MARK: Properties
	
	/// The operation queue which will run the children operations.
	public let queue: OperationQueue

	/**
	The container to store any error that occurs while executing the children operations.
	
	- note: This operation is cancelled when an error is set.
	*/
	public var error: Error? {
		didSet {
			guard error != nil else {
				return
			}
			
			cancel()
		}
	}
	
	// MARK: Initializers
	
	/// Creates an operation.
	public init() {
		self.queue = OperationQueue()
		
		super.init()
		
		self.queue.isSuspended = true
	}
	
	/**
	Creates an operation with an execution block.
	
	- parameter executionBlock: Execution block.
	- note: this initializer is hidden.
	*/
	private override init(executionBlock: ExecutionBlock?) {
		self.queue = OperationQueue()
		
		super.init(executionBlock: executionBlock)
		
		self.queue.isSuspended = true
	}

	// MARK: Functions
	
	/// Start the operation.
	override open func start() {
		queue.isSuspended = false
		
		super.start()
	}
	
	/// Pause the operation.
	override open func pause() {
		queue.pause()
		
		super.pause()
	}
	
	/// Resume the operation.
	override open func resume() {
		queue.resume()
		
		super.resume()
	}
	
	/// Cancel the operation.
	override open func cancel() {
		queue.cancelAllOperations()
		
		super.cancel()
	}

}
