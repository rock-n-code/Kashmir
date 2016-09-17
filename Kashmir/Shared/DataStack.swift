//
//  DataStack.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/08/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation
import CoreData

public class DataStack {

	// MARK: - Constants

	public static let manager: DataStack = {
		return DataStack()
	}()

	// MARK: - Properties

	var containers: [String : NSPersistentContainer]

	// MARK: - Initialisation

	init() {
		containers = [:]
	}

	// MARK: - Functions

	public func add(_ modelName: String) throws {
		try isNotEmpty(modelName)

		guard let url = Bundle.url(forResource: modelName, withExtension: "momd") else {
			throw DataStackError.objectModelNotFound
		}

		guard let objectModel = NSManagedObjectModel(contentsOf: url) else {
			throw DataStackError.objectModelNotCreated
		}

		try doesNotExists(modelName)

		let container = NSPersistentContainer(name: modelName, managedObjectModel: objectModel)

		container.loadPersistentStores { [unowned self] storeDescription, error in
			if let error = error as NSError? {
				// TODO: Throw the error back to the caller.
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
			else {
				self.containers[modelName] = container
			}
		}
	}

	public func remove(_ modelName: String) throws {
		try isNotEmpty(modelName)
		try doesExists(modelName)

		guard let container = containers[modelName]
			else {
				throw DataStackError.containerNotFound
		}

		let coordinator = container.persistentStoreCoordinator

		for store in coordinator.persistentStores {
			guard let url = store.url
				else {
					throw DataStackError.storeUrlNotFound
			}

			try coordinator.remove(store)

			if store.type != NSInMemoryStoreType {
				let urlPath = url.path

				try FileManager.default.removeItem(atPath: urlPath)

				if store.type == NSSQLiteStoreType {
					let shmPath = "\(urlPath)-shm"
					let walPath = "\(urlPath)-wal"

					try FileManager.default.removeItem(atPath: shmPath)
					try FileManager.default.removeItem(atPath: walPath)
				}
			}
		}

		containers[modelName] = nil
	}

	public func foreContext(of modelName: String) throws -> NSManagedObjectContext {
		try isNotEmpty(modelName)
		try doesExists(modelName)

		return containers[modelName]!.viewContext
	}

	public func backContext(of modelName: String) throws -> NSManagedObjectContext {
		try isNotEmpty(modelName)
		try doesExists(modelName)

		return containers[modelName]!.newBackgroundContext()
	}

	public func save() throws -> () {
		containers.forEach { name, container in
			let context = container.viewContext

			if context.hasChanges {
				do {
					try context.save()
				} catch let error as NSError {
					fatalError("Unresolved error \(error), \(error.userInfo)")
				}
			}
		}
	}

	// MARK: - Helpers

	private func isNotEmpty(_ modelName: String) throws {
		guard !modelName.isEmpty else {
			throw DataStackError.containerNameIsEmpty
		}
	}

	private func doesNotExists(_ modelName: String) throws {
		guard !containers.keys.contains(modelName) else {
			throw DataStackError.containerNameExists
		}
	}

	private func doesExists(_ modelName: String) throws {
		guard containers.keys.contains(modelName) else {
			throw DataStackError.containerNameNotExists
		}
	}

}
