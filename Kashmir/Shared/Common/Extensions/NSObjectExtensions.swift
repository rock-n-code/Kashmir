//
//  NSObjectExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 21/08/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

public extension NSObject {

	// MARK: Properties

	/// Returns the name of the class as a *String* type.
	static var denomination: String {
		return String(describing: self)
	}

	/// Returns the name of the class of the object instance as a *String* type.
	var nameOfClass: String {
		return "\(type(of: self))"
	}

}
