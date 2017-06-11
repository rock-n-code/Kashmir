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

	/// Returns a `DateFormatter` instance ready to use set on current locale and UTC timezone.
	static var utc: DateFormatter {
		let dateFormatter = DateFormatter()
		
		dateFormatter.locale = Locale.current
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		
		return dateFormatter
	}

	/// Returns a `DateFormatter` instance ready to use set on current locale and timezone.
	static var local: DateFormatter {
		let dateFormatter = DateFormatter()
		
		dateFormatter.locale = Locale.current
		dateFormatter.timeZone = TimeZone.current
		
		return dateFormatter
	}
	
}
