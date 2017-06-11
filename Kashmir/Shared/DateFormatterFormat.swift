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
		/// Full date and time ISO8601 format on UTC timezone.
		public static var iso8601FullDateTimeUTC = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
	}
	
}
