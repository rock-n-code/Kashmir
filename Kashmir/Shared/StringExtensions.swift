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
		let customAllowedSet = CharacterSet(charactersIn:"!*'();:@&=+$,/?%#[]").inverted

		return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
	}
	
	/// Returns an `URL` instance out of the current string.
	var toUrl: URL? {
		guard !self.isEmpty else {
			return nil
		}
		
		return URL(string: self)
	}
    
    // MARK: Functions
    
    /**
    Gets the index positions of a given character within the current string.
    
    - parameter character: The character to search on a atring.
    - returns: An array containing the index positions for the occurrences of the character within the string if any. Otherwise, an empty array.
    */
    func indexes(of character: Character) -> [Int] {
        return characters.enumerated().filter { $0.element == character }.map { $0.offset }
    }
    
}
    
