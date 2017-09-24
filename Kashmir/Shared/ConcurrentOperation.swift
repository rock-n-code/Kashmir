//
//  ConcurrentOperation.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 21/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

open class ConcurrentOperation: Operation {
	
	// MARK: Constants
	
	fileprivate struct Key {
		fileprivate static let isExecuting = "isExecuting"
		fileprivate static let isFinished = "isFinished"
	}
	
	// MARK: Properties
	
	/// Operation's execution block.
	public var executionBlock: ExecutionBlock?
	
	/// Set the operation as asynchronous.
	open override var isAsynchronous: Bool {
		return true
	}

	/// Set if the operation is executing.
	open override var isExecuting: Bool {
		return _executing
	}
	
	/// Set if the operation is finished.
	open override var isFinished: Bool {
		return _finished
	}
	
	/// Set if the operation is executing.
	private var _executing = false {
		willSet {
			willChangeValue(forKey: Key.isExecuting)
		}
		didSet {
			didChangeValue(forKey: Key.isExecuting)
		}
	}
	
	/// Set if the operation is finished.
	private var _finished = false {
		willSet {
			willChangeValue(forKey: Key.isFinished)
		}
		didSet {
			didChangeValue(forKey: Key.isFinished)
		}
	}
	
	// MARK: Initializers
	
	/**
	Creates the operation with an execution block.
	
	- parameter executionBlock: Execution block.
	*/
	public init(executionBlock: ExecutionBlock? = nil) {
		super.init()
		
		self.executionBlock = executionBlock
	}
	
	// MARK: Functions

	/// Start the operation.
	open override func start() {
		_executing = true
		
		execute()
	}
	
	/**
	Execute the operation.
	
	- note: If `executionBlock` is set, it will be executed and also `finish()` will be called.
	*/
	open func execute() {
		guard let executionBlock = executionBlock else {
			return
		}
		
		executionBlock()
		finish()
	}
	
	/**
	Notify the completion of async task and hence the completion of the operation.
	
	- note: Must be called when the operation is finished.
	*/
	public func finish() {
		_executing = false
		_finished = true
	}
	
	/**
	Pause the current Operation, if it's supported.
	
	- note: Must be overridend by subclass to get a custom pause action.
	*/
	open func pause() {}
	
	/**
	Resume the current Operation, if it's supported.
	
	- note: Must be overridend by subclass to get a custom resume action.
	*/
	open func resume() {}

	/**
	Adds the operation to the custom queue.
	
	- parameter queue: Custom queue where the operation will be added.
	*/
	public func add(to queue: OperationQueue) {
		queue.addOperation(self)
	}
	
}
