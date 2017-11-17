//
//  GroupOperation.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 14/11/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

open class GroupOperation: ConcurrentOperation {
	
	// MARK: Properties
	
	public let queue: OperationQueue
	
	public var error: Error? {
		didSet {
			guard error != nil else {
				return
			}
			
			cancel()
		}
	}
	
	// MARK: Initializers
	
	public init() {
		self.queue = OperationQueue()
		
		super.init()
		
		self.queue.isSuspended = true
	}

	// MARK: Functions
	
	override open func start() {
		queue.isSuspended = false
		
		super.start()
	}

	override open func cancel() {
		queue.cancelAllOperations()
		
		super.cancel()
	}
	
	override open func pause() {
		queue.pause()
		
		super.pause()
	}
	
	override open func resume() {
		queue.resume()
		
		super.resume()
	}

}
