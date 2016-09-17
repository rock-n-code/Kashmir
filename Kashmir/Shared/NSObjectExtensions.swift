//
//  NSObjectExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 21/08/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension NSObject {

	// MARK: - Properties

	/// Returns the name of the class as a *String* type.
	public static var name: String {
		return "\(self)"
	}

	/// Returns the name of the class of the object instance as a *String* type.
	public var nameClass: String {
		return "\(type(of: self))"
	}

}
