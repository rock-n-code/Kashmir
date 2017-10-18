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
		static let utc = "z$"
		static let offset = "[-|+]\\d{2}[:]\\d{2}$"
	}
	
	// MARK: Initializers
	
	init?(dateString: String) {
		do {
			let wholeRange = NSRange(dateString.startIndex..., in: dateString)
			let utcExpression = try NSRegularExpression(pattern: RegularExpression.utc, options: .caseInsensitive)
			let offsetExpression = try NSRegularExpression(pattern: RegularExpression.offset, options: .caseInsensitive)
			let utcMatches = utcExpression.matches(in: dateString, range: wholeRange)
			let offsetMatches = offsetExpression.matches(in: dateString, range: wholeRange)
			
			guard !utcMatches.isEmpty || !offsetMatches.isEmpty else {
				return nil
			}
			
			var secondsFromGMT = 0
			
			if let range = offsetMatches.first?.range {
				let substring = (dateString as NSString).substring(with: range)
				let components = substring.components(separatedBy: ":")
				
				if
					let firstComponent = components.first,
					let lastComponent = components.last,
					let hours = Int(firstComponent),
					let minutes = Int(lastComponent)
				{
					secondsFromGMT = hours * 3600 + minutes * 60
				}
			}
			
			self.init(secondsFromGMT: secondsFromGMT)
		}
		catch {
			return nil
		}
	}
	
}
