//
//  DataStackError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/08/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

public enum DataStackError: Error {
	case ObjectModelNotFound
	case ObjectModelNotCreated
	case ContainerNotFound
	case StoreUrlNotFound
	case ContainerNameIsEmpty
	case ContainerNameExists
	case ContainerNameNotExists
	case Other(NSError)
}
