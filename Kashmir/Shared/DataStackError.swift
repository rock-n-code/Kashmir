//
//  DataStackError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/08/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

/// Representation of the errors that could be encountered while using *DataStack*.
///
/// - **objectModelNotFound**:		A file of extension *.momd* containing the object model to use with *CoreData* was not found on any of the bundles included on the project or workspace.
/// - **objectModelNotCreated**:	A *CoreData* managed object model have not been created on the current bundle by its initializer.
/// - **storeUrlNotFound**:			A persistance store containing the physical database have not been found on the file system.
/// - **containerNotFound**:		A *NSPersistentContainer* instance have not been found on the list of containers managed by *DataStack*.
/// - **containerNameIsEmpty**:		A container name passed to *DataStack* is actually an empty string.
/// - **containerNameExists**:		A container name passed to *DataStack* does exist on the list of containers it manages.
/// - **containerNameNotExists**:	A container name passed to *DataStack* does not exist on the list of containers it manages.
/// - **other**:					Any other type of *NSError* encountered while using *DataStack*.
public enum DataStackError: Error {
	case objectModelNotFound
	case objectModelNotCreated
	case storeUrlNotFound
	case containerNotFound
	case containerNameIsEmpty
	case containerNameExists
	case containerNameNotExists
	case other(NSError)
}
