//
//  Constant.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 31/07/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

/**
The type used to define a nested constant type, inspired by the `NSNotification.Name` type.
*/
public class Constant {
	
	// MARK: Properties
	
	/// The hidden value of the defined constant.
	private let constant: String
	
	/// The exposed value of the defined constant.
	public var value: String {
		return constant
	}
	
	// MARK: Initializers

	/**
	Default initializer.
	
	- parameter constant: The string to define as constant.
	*/
	public required init(_ constant: String) {
		self.constant = constant
	}
	
}

// MARK: - Equatable

extension Constant: Equatable {

	// MARK: Functions

	/**
	Indicates whether two constants are equal.

	- parameters:
	   - lhs: The constant at the left side of the `==` operator.
	   - rhs: The constant at the right side of the `==` operator.
	- returns: A Boolean value indicating whether two constants are equal.
	*/
	public static func == (lhs: Constant,
						   rhs: Constant) -> Bool {
		return lhs.constant == rhs.constant
	}
	
}
