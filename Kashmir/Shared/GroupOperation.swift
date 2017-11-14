//
//  GroupOperation.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 14/11/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

public class GroupOperation: ConcurrentOperation {
	
	// MARK: Properties
	
	public let queue: OperationQueue
	
	// MARK: Initializers
	
	public init() {
		self.queue = OperationQueue()
		
		super.init()
		
		self.queue.isSuspended = true
	}

	// MARK: Functions
	
	public override func start() {
		queue.isSuspended = false
		
		super.start()
	}

	override public func cancel() {
		queue.cancelAllOperations()
		
		super.cancel()
	}
	
	override public func pause() {
		queue.pause()
		
		super.pause()
	}
	
	override public func resume() {
		queue.resume()
		
		super.resume()
	}

}
