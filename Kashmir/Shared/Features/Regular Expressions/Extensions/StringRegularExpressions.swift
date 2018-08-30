//
//  StringRegularExpressions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 30/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Foundation

public extension String {
	
	// MARK: Operators
	
	/**
	Matches a regular expression in a string.
	
	- parameters:
	- lhs: A string to match against the regular expression.
	- rhs: A regular expression to match.
	- returns: A boolean value that indicates whether the regular expression matches in a string or not.
	*/
	static func ~?> (lhs: String,
					 rhs: String) -> Bool {
		do {
			let wholeRange = NSRange(rhs.startIndex..., in: rhs)
			let regularExpression = try NSRegularExpression(pattern: lhs, options: .init(rawValue: 0))
			
			return !regularExpression.matches(in: rhs, range: wholeRange).isEmpty
		}
		catch {
			return false
		}
	}
	
	/**
	Matches a regular expression in a string with checking results.
	
	- parameters:
	- lhs: A string to match against the regular expression.
	- rhs: A regular expression to match.
	- returns: An array containing the match results of the matching of a regular expression in a string.
	*/
	static func ~~> (lhs: String,
					 rhs: String) -> [NSTextCheckingResult] {
		do {
			let wholeRange = NSRange(rhs.startIndex..., in: rhs)
			let regularExpression = try NSRegularExpression(pattern: lhs, options: .init(rawValue: 0))
			
			return regularExpression.matches(in: rhs, range: wholeRange)
		}
		catch {
			return []
		}
	}
	
}
