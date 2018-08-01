//
//  CoreDataDecodable.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Foundation
import CoreData

public protocol CoreDataDecodable: Decodable {
	
	// MARK: Associated types
	
	associatedtype DTO: Decodable
	
	// MARK: Static
	
	static func makePredicate(from dto: DTO) -> NSPredicate?
	
	// MARK: Initializers
	
	init(dto: DTO,
		 context: NSManagedObjectContext) throws
	
	// MARK: Functions

	func update(from dto: DTO) throws
	
}

// MARK: -

public extension CoreDataDecodable {
	
	// MARK: Static
	
	static func makePredicate(from dto: DTO) -> NSPredicate? {
		return nil
	}
	
	// MARK: Initializers
	
	public init(from decoder: Decoder) throws {
		try self.init(dto: DTO(from: decoder),
					  context: .decodingContext(at: decoder.codingPath))
	}
	
}

// MARK: -

public extension CoreDataDecodable where Self: NSManagedObject {
	
	// MARK: Static
	
	static func createNew(from dto: DTO,
						  in context: NSManagedObjectContext) throws -> Self {
		return try self.init(dto: dto,
							 context: context)
	}
	
	static func findFirst(from dto: DTO,
						  in context: NSManagedObjectContext) throws -> Self? {
		guard
			let request = self.fetchRequest() as? NSFetchRequest<Self>,
			let predicate = self.makePredicate(from: dto)
		else {
			return nil
		}
		
		request.predicate = predicate
		request.fetchLimit = 1
		request.resultType = .managedObjectResultType
		
		return try context.fetch(request).first
	}
	
	static func findOrCreate(from dto: DTO,
							 in context: NSManagedObjectContext) throws -> Self {
		if let object = try findFirst(from: dto,
									  in: context) {
			return object
		}
		else {
			return try createNew(from: dto,
								 in: context)
		}
	}
	
	static func createOrUpdate(from dto: DTO,
							   in context: NSManagedObjectContext) throws -> Self {
		if let object = try findFirst(from: dto,
									  in: context) {
			try object.update(from: dto)

			return object
		}
		else {
			return try createNew(from: dto,
								 in: context)
		}
	}
	
	// MARK: Initializers
	
	init(dto: DTO,
		 context: NSManagedObjectContext) throws {
		self.init(context: context)
		
		try update(from: dto)
	}
	
}
