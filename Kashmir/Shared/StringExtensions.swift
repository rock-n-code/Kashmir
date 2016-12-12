//
//  StringExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

public extension String {

	// MARK: Properties

	/// Returns an encoded version of the current string to use with *URL* paths.
	var urlEncoded: String {
		let customAllowedSet = CharacterSet(charactersIn:"!*'();:@&=+$,/?%#[]").inverted

		return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
	}
    
    // MARK: Functions
    
    func indexes(of character: Character) -> [Int] {
        return characters.enumerated().filter { $0.element == character }.map { $0.offset }
    }
    
}
