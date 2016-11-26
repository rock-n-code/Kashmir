//
//  DataStack.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/08/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation
import CoreData

/// This class simplifies the creation and management of multiple Core Data stack by handling the creation of the *NSPersistentContainer* instances.
public class DataStack {

	// MARK: Constants

	/// Returns a singleton instance of the *DataStack* class.
	public static let manager: DataStack = {
		return DataStack()
	}()

	// MARK: Properties

	/// Dictionary which uses model names as keys and initialized containers as values.
	var containers: [String : NSPersistentContainer]

	// MARK: Initialisation

	/// Default initializer.
	///
	/// - returns: A *DataStack* instance with an empty containers dictionary.
	init() {
		containers = [:]
	}

	// MARK: Functions

	/// Add a container to its dictionary.
	///
	/// - parameter modelName: The model name in which a container will be initialized.
	/// - throws: A *DataStackError* type error in case during the execution of this method.
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

	/// Remove a container from its dictionary.
	///
	/// - parameter modelName: The model name in which a container has been initialized.
	/// - throws: A *DataStackError* type error in case during the execution of this method.
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

	/// Get the managed object context associated with the main queue from a given container.
	///
	/// - parameter modelName: The model name in which a container has been initialized.
	/// - throws: A *DataStackError* type error in case during the execution of this method.
	/// - returns: The managed object context from the requested container.
	public func foreContext(of modelName: String) throws -> NSManagedObjectContext {
		try isNotEmpty(modelName)
		try doesExists(modelName)

		return containers[modelName]!.viewContext
	}

	/// Get a new private managed object context associated with the concurrent queue from a given container.
	///
	/// - parameter modelName: The model name in which a container has been initialized.
	/// - throws: A *DataStackError* type error in case during the execution of this method.
	/// - returns: A managed object context from the requested container.
	public func backContext(of modelName: String) throws -> NSManagedObjectContext {
		try isNotEmpty(modelName)
		try doesExists(modelName)

		return containers[modelName]!.newBackgroundContext()
	}

	/// Attemps to commit unsaved changes registered on the managed object context associated with the main queue for each and every container in the dictionary.
	///
	/// - throws: A *DataStackError* type error in case during the execution of this method.
	public func save() throws -> () {
		containers.forEach { name, container in
			let context = container.viewContext

			if context.hasChanges {
				do {
					try context.save()
				} catch let error as NSError {
					// TODO: Throw the error back to the caller.
					fatalError("Unresolved error \(error), \(error.userInfo)")
				}
			}
		}
	}

	// MARK: Helpers

	/// Check if a given model name is not an empty string.
	///
	/// - parameter modelName: The model name in which a container has been initialized.
	/// - throws: A *DataStackError* type error in case the requested model name is an empty string.
	private func isNotEmpty(_ modelName: String) throws {
		guard !modelName.isEmpty else {
			throw DataStackError.containerNameIsEmpty
		}
	}

	/// Check if a container does not exist in the containers' dictionary.
	///
	/// - parameter modelName: The model name in which a container has been initialized.
	/// - throws: A *DataStackError* type error in case the requested model name is found in the keys' array of the containers' dictionary.
	private func doesNotExists(_ modelName: String) throws {
		guard !containers.keys.contains(modelName) else {
			throw DataStackError.containerNameExists
		}
	}

	/// Check if a container does exist in the containers' dictionary.
	///
	/// - parameter modelName: The model name in which a container has been initialized.
	/// - throws: A *DataStackError* type error in case the requested model name is not found in the keys' array of the containers' dictionary.
	private func doesExists(_ modelName: String) throws {
		guard containers.keys.contains(modelName) else {
			throw DataStackError.containerNameNotExists
		}
	}

}
