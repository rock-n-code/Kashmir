//
//  TimeZoneExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 14/10/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

public extension TimeZone {
	
	// MARK: Constants
	
	private struct RegularExpression {
		static let utc = "[z|Z]$"
		static let offset = "[-|+]\\d{2}[:]\\d{2}$"
	}
	
	// MARK: Initializers
	
	/**
	Initialize a `TimeZone` instance with a date formatted in ISO8601 format.
	
	- parameter dateString: a date string formatted in ISO8601 format.
	- note: In case the date string does not comply with the requirements of the ISO8601 format, no instance will be created.
	*/
	init?(dateString: String) {
		let utc = RegularExpression.utc ~~> dateString
		let offset = RegularExpression.offset ~~> dateString
		
		guard !utc.isEmpty || !offset.isEmpty else {
			return nil
		}
		
		guard
			let range = offset.first?.range,
			let subrange = Range(range, in: dateString)
		else {
			self.init(secondsFromGMT: 0)
			return
		}
		
		let components = dateString[subrange].components(separatedBy: ":")

		guard
			components.count == 2, 
			let firstComponent = components.first,
			let lastComponent = components.last,
			let hours = Int(firstComponent),
			let minutes = Int(lastComponent)
		else {
			self.init(secondsFromGMT: 0)
			return
		}
		
		self.init(secondsFromGMT: hours * 3600 + minutes * 60)
	}
	
}
