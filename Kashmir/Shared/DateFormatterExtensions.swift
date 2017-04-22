//
//  DateFormatterExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/04/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

public extension DateFormatter {
	
	// MARK: Static
	
	static var utc: DateFormatter {
		let dateFormatter = DateFormatter()
		
		dateFormatter.locale = Locale.current
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		
		return dateFormatter
	}
	
	static var local: DateFormatter {
		let dateFormatter = DateFormatter()
		
		dateFormatter.locale = Locale.current
		dateFormatter.timeZone = TimeZone.current
		
		return dateFormatter
	}
	
}
