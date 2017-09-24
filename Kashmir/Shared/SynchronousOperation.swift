//
//  SynchronousOperation.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/08/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

/**
It allows synchronous tasks, has a pause and resume states, can be easily added to a queue and can be created with a block.
*/
public class SynchronousOperation: ConcurrentOperation {
	
	// MARK: Constants
	
	/// Private semaphore instance.
	let semaphore = Semaphore()
	
	// MARK: Properties
	
	/// Set the operation as synchronous.
	public override var isAsynchronous: Bool {
		return false
	}
	
	// MARK: Functions
	
	/**
	Notify the completion of sync task and hence the completion of the operation.
	
	- note: Must be called when the operation is finished.
	*/
	public override func finish() {
		semaphore.continue()
	}
	
	/**
	Advises the operation object that it should stop executing its task.
	*/
	public override func cancel() {
		super.cancel()
		
		semaphore.continue()
	}
	
	/**
	Execute the operation.
	
	- note: If `executionBlock` is set, it will be executed and also `finish()` will be called.
	*/
	public override func execute() {
		super.execute()
		
		semaphore.wait()
	}
	
}
