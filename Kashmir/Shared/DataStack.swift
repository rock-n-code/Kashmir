//
//  DataStack.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/08/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import CoreData

/**
This class simplifies the creation and management of multiple Core Data stack by handling the creation of the `NSPersistentContainer` instances.
*/
public class DataStack {

	// MARK: Constants

	/// Returns a singleton instance of the `DataStack` class.
	public static let manager = DataStack()

    // MARK: Properties

	/// Dictionary which uses model names as keys and initialized containers as values.
	var containers: [String : NSPersistentContainer]

	// MARK: Initializations

    /**
	Default initializer.
	
    - returns: A `DataStack` instance with an empty containers dictionary.
    */
	init() {
		containers = [:]
	}

	// MARK: Functions

    /**
    Add a container to its dictionary.
	
    - parameters:
      - model: The model name in which a container will be initialized.
      - type: The store type in which a container will be initialized.
	- throws: A `DataStackError` type error in case during the execution of this method.
    */
    public func add(_ model: String, of type: DataStack.Store = .sql) throws {
        try validate(model, for: [.modelNameIsNotEmpty])
		
		guard let url = Bundle.url(forResource: model, withExtension: "momd") else {
			throw DataStackError.objectModelNotFound
		}

		guard let objectModel = NSManagedObjectModel(contentsOf: url) else {
			throw DataStackError.objectModelNotCreated
		}

        try validate(model, for: [.containerNotExists])
		
		let container = NSPersistentContainer(name: model, managedObjectModel: objectModel)
        let defaultDescription = makeDescription(for: model, with: type)
        
        container.persistentStoreDescriptions = [defaultDescription]

		container.loadPersistentStores { [unowned self] storeDescription, error in
			if let error = error as NSError? {
				// TODO: Throw the error back to the caller.
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
			else {
				self.containers[model] = container
			}
		}
	}

    /**
    Remove a container from its dictionary.
	
    - parameter model: The model name in which a container has been initialized.
	- throws: A `DataStackError` type error in case during the execution of this method.
    */
	public func remove(_ model: String) throws {
        try validate(model, for: [.modelNameIsNotEmpty, .containerExists])

        guard let container = containers[model] else {
            throw DataStackError.containerNotFound
		}

		let coordinator = container.persistentStoreCoordinator

		for store in coordinator.persistentStores {
			guard let url = store.url else {
                throw DataStackError.storeUrlNotFound
			}

			try coordinator.remove(store)

			if store.type != NSInMemoryStoreType {
				var urls = [url.path]
				
				if store.type == NSSQLiteStoreType {
					urls += ["\(url.path)-shm", "\(url.path)-wal"]
				}
				
				try urls.forEach {
					try FileManager.default.removeItem(atPath: $0)
				}
			}
		}

		containers[model] = nil
	}

    /**
	Get the managed object context associated with the main queue from a given container.
	
    - parameter model: The model name in which a container has been initialized.
	- throws: A `DataStackError` type error in case during the execution of this method.
	- returns: The managed object context from the requested container.
    */
	public func foreContext(of model: String) throws -> NSManagedObjectContext {
        try validate(model, for: [.modelNameIsNotEmpty, .containerExists])

		return containers[model]!.viewContext
	}

    /**
	Get a new private managed object context associated with the concurrent queue from a given container.
	
    - parameter model: The model name in which a container has been initialized.
	- throws: A `DataStackError` type error in case during the execution of this method.
	- returns: A managed object context from the requested container.
    */
	public func backContext(of model: String) throws -> NSManagedObjectContext {
        try validate(model, for: [.modelNameIsNotEmpty, .containerExists])

        return containers[model]!.newBackgroundContext()
	}

    /**
	Attemps to commit unsaved changes registered on the managed object context associated with the main queue for each and every container in the dictionary.
	
    - throws: A `DataStackError` type error in case during the execution of this method.
    */
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

    /**
    Makes a default persistent store description tailored to a given model and its respective store type.
    
    - parameters:
	  - model: The model name in which a container has been initialized.
	  - type: The store type in which a container will be initialized.
    - returns: A persistent store description with all the relevant configuration to initialize a container.
    */
    fileprivate func makeDescription(for model: String, with type: DataStack.Store) -> NSPersistentStoreDescription {
        let description = NSPersistentStoreDescription()

        description.configuration = "Default"
        description.type = type.rawValue
        description.isReadOnly = false
        description.shouldAddStoreAsynchronously = false
        description.shouldInferMappingModelAutomatically = true
        description.shouldMigrateStoreAutomatically = true
        
        if type != .inMemory {
            let directory = NSPersistentContainer.defaultDirectoryURL()
            
            description.url = directory.appendingPathComponent("\(model.lowercased()).\(type.extensionValue)")
        }
        
        return description
    }
    
    /**
    Validates a model and/or its container based on a provided list of validation options.
    
    - parameters:
      - model: The model name in which a container has been initialized.
      - validations: A list of validation options to validate.
    - throws: A `DataStackError` type error in case in case any of the requested validation checks fails.
    */
    fileprivate func validate(_ model: String, for validations: [DataStack.Validation]) throws {
        try validations.forEach {
            switch $0 {
                case .modelNameIsNotEmpty where model.isEmpty:
                    throw DataStackError.containerNameIsEmpty
                case .containerExists where !containers.keys.contains(model):
                    throw DataStackError.containerNameNotExists
                case .containerNotExists where containers.keys.contains(model):
                    throw DataStackError.containerNameExists
                default:
                    return
            }
        }
    }

}
