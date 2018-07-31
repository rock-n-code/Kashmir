//
//  Nomenclature.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 31/07/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

/**
The type used to define a nested constant type, inspired by the `NSNotification.Name` type.
*/
public class Nomenclature {
	
	// MARK: Properties
	
	/// The hidden value of the defined constant.
	private let name: String
	
	/// The exposed value of the defined constant.
	public var value: String {
		return name
	}
	
	// MARK: Initializers

	/**
	Default initializer.
	
	- parameter constant: The string to define as constant.
	*/
	public required init(_ name: String) {
		self.name = name
	}
	
}

// MARK: - Equatable

extension Nomenclature: Equatable {

	// MARK: Functions

	/**
	Indicates whether two nomenclatures are equal.

	- parameters:
	   - lhs: The nomenclature at the left side of the `==` operator.
	   - rhs: The nomenclature at the right side of the `==` operator.
	- returns: A Boolean value indicating whether two nomenclatures are equal.
	*/
	public static func == (lhs: Nomenclature,
						   rhs: Nomenclature) -> Bool {
		return lhs.name == rhs.name
	}
	
}
