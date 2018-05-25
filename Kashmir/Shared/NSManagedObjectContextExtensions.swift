//
//  NSManagedObjectContextExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
	
	// MARK: Static
	
	private static var _decodingContext: NSManagedObjectContext?
	
	static func decodingContext(at codingPath: [CodingKey] = []) throws -> NSManagedObjectContext {
		guard let context = _decodingContext else {
			throw CoreDataDecodingError.missingContext(codingPath: codingPath)
		}
		
		return context
	}
	
	// MARK: Functions
	
	public final func asDecodingContext(do work: ExecutionBlock) {
		NSManagedObjectContext._decodingContext = self
		
		defer {
			NSManagedObjectContext._decodingContext = nil
		}
		performAndWait {
			work()
		}
	}
	
}

