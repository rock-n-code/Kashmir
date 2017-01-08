//
//  Result.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 07/01/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

public enum Result<T> {
	case value(T)
	case error(Error)
	
	// MARK: Properties
	
	public var value: T? {
		switch self {
			case .value(let value):
				return value
			default:
				return nil
		}
	}
	
	public var error: Error? {
		switch self {
			case .error(let error):
				return error
			default:
				return nil
		}
	}
	
	// MARK: Initializations
	
	public init(function: () throws -> T) {
		do {
			self = .value(try function())
		}
		catch let error {
			self = .error(error)
		}
	}
	
	
}
