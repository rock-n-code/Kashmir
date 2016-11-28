//
//  NSObjectExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 21/08/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

public extension NSObject {

	// MARK: Properties

	/// Returns the name of the class as a *String* type.
	static var name: String {
		return "\(self)"
	}

	/// Returns the name of the class of the object instance as a *String* type.
	var nameClass: String {
		return "\(type(of: self))"
	}

}
