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

	public static var name: String {
		return "\(self)"
	}

	public var nameClass: String {
		return "\(type(of: self))"
	}

}