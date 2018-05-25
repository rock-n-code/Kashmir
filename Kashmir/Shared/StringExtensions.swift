//
//  StringExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

public extension String {
	
	// MARK: Properties

	/// Returns an encoded version of the current string to use with `URL` paths.
	var urlEncoded: String {
		let customAllowedSet = CharacterSet(charactersIn:" !*'();:@&=+$,/?%#[]").inverted

		return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
	}
	
	/// Returns an `URL` instance out of the current string.
	var toUrl: URL? {
		return URL(string: self)
	}
	
	// MARK: Operations
	
	/**
	Matches a regular expression in a string.
	
	- parameters:
	    - lhs: A string to match against the regular expression.
	    - rhs: A regular expression to match.
	- returns: A boolean value that indicates whether the regular expression matches in a string or not.
	*/
	static func ~?>(lhs: String, rhs: String) -> Bool {
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
	static func ~~>(lhs: String, rhs: String) -> [NSTextCheckingResult] {
		do {
			let wholeRange = NSRange(rhs.startIndex..., in: rhs)
			let regularExpression = try NSRegularExpression(pattern: lhs, options: .init(rawValue: 0))
			
			return regularExpression.matches(in: rhs, range: wholeRange)
		}
		catch {
			return []
		}
	}

	// MARK: Functions
    
    /**
    Gets the index positions of a given character within the current string.
    
    - parameter character: The character to search on a atring.
    - returns: An array containing the index positions for the occurrences of the character within the string if any. Otherwise, an empty array.
    */
    func indexes(of character: Character) -> [Int] {
        return enumerated().filter { $0.element == character }.map { $0.offset }
    }

}
