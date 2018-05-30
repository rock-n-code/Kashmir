//
//  IntExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 31/05/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

public extension Int {
	
	// MARK: Initializers
	
	/**
	Initialize a `Int` instance from a boolean instance.
	
	- parameter bool: A `Bool` instance use to init.
	*/
	init(bool: Bool) {
		self = bool ? 1 : 0
	}
	
}
