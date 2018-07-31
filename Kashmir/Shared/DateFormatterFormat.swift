//
//  DateFormatterFormat.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 22/04/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import Foundation

public extension DateFormatter {
	
	// MARK: Constants
	
	/**
	The structure which contains the custom date/time formats to use with a `DateFormatter` instance defined as constants.
	*/
	public struct Format {
		
		// MARK: Initializers
		
		private init() {}
		
		// MARK: Static
		
		/// Full date and time ISO8601 format.
		public static let iso8601FullDate = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		/// Full date and time ISO8601 format on UTC timezone.
		public static let iso8601FullDateTimeUTC = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
	}
	
}
