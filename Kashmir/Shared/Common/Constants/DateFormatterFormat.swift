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
	public class Format: Nomenclature {

		// MARK: Static
		
		/// Full date and time ISO8601 format.
		public static let iso8601FullDate = DateFormatter.Format("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
		
		/// Full date and time ISO8601 format on UTC timezone.
		public static let iso8601FullDateTimeUTC = DateFormatter.Format("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
		
	}
	
}
