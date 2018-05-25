//
//  CellError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 19/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

/**
Representation of the errors that could be encountered while using *Cell*.
*/
enum CellError: Error {
	/// Cell failed to dequeue from a table or collection.
	case dequeueFailed
}
