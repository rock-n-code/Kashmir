//
//  Cell.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 19/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

/**
This protocol defines the minimal requirements a compliant cell instance should implement to provide common functionalities to a cell.
*/
public protocol Cell: class {
	
	// MARK: Types
	
	/// Defines the data type to use with the cell.
	associatedtype CellData
	
	// MARK: Static
	
	static var nibName: String { get }
	static var reuseIdentifier: String { get }
	static var estimatedHeight: Float { get }
	
	// MARK: Functions
	
	func reset()
	func update()
	func set(with data: CellData)
	
}

// MARK: -

public extension Cell {
	
	// MARK: Static

	/// Gets the name of the nib view the cell uses.
	static var nibName: String {
		return String(describing: self)
	}
	
	/// Gets the reuse identifier of the cell.
	static var reuseIdentifier: String {
		return String(describing: self)
	}
	
	/// Gets the estimated height of the cell
	static var estimatedHeight: Float {
		return 0.0
	}
	
	// MARK: Functions
	
	/**
	...
	*/
	func reset() {
//		Force empty implementation unless overwritten in the cell.
	}
	
	/**
	...
	*/
	func update() {
//		Force empty implementation unless overwritten in the cell.
	}
	
}
