//
//  Result.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 07/01/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

/**
Representation of a result that encapsulates either a failure with an explanatory error, or a success with a result value.

- value: A result value of a defined `T` type.
- error: An error of `Error` type.
*/
public enum Result<T> {
	/// A result value of a defined `T` type.
	case value(T)
	/// An error of `Error` type.
	case error(Error)
	
	// MARK: Properties
	
	/// Returns a value if any, otherwise it returns nil.
	public var value: T? {
		switch self {
			case .value(let value):
				return value
			default:
				return nil
		}
	}
	
	/// Returns an error if any, otherwise it returns nil.
	public var error: Error? {
		switch self {
			case .error(let error):
				return error
			default:
				return nil
		}
	}
	
	// MARK: Initializers
	
	/**
	Initializes the enumeration by executing a function which is expected to either provide a result or throw an error.
	
	- parameter function: The function or block of code to execute that provide a result of `T` type or throws an error in case of failure.
	*/
	public init(function: () throws -> T) {
		do {
			self = .value(try function())
		}
		catch let error {
			self = .error(error)
		}
	}
	
	// MARK: Functions
	
	/**
	Dematerializes the enumeration by either providing a value or throwing an error if necessary. 
	
	- returns: A value of `T` type in case the value exists.
	- throws: An error of `Error` type in case the error exists.
	*/
	@discardableResult
	public func dematerialize() throws -> T {
		switch self {
			case let .value(value):
				return value
			case let .error(error):
				throw error
		}
	}
	
}
