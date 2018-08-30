//
//  UserDefaultsExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 15/02/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

extension UserDefaults {
	
	// MARK: Functions
	
	/**
	Sets the value of the specified default key to a custom object.
	
	- parameters:
	  - value: An object compliant to the `NSCoding` protocol.
	  - key: The key with which to associate with the value.
	*/
	open func set(_ value: NSCoding, forKey key: String) {
		let archivedObject = NSKeyedArchiver.archivedData(withRootObject: value)
		
		set(archivedObject, forKey: key)
	}
	
	/**
	Returns a custom object associated with the specified key.
	
	- parameter key: A key in the current user's defaults database.
	- returns: A custom object that is copmpliant to the `NSCoding` protocol.
	*/
	open func decode(forKey key: String) -> Any? {
		guard
			let data = object(forKey: key) as? Data,
			let unarchivedObject = NSKeyedUnarchiver.unarchiveObject(with: data)
		else {
			return nil
		}

		return unarchivedObject
	}
	
}
