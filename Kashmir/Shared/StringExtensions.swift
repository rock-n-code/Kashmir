//
//  StringExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension String {

	// MARK: Properties

	/// Returns an encoded version of the current string to use with *URL* paths.
	public var urlEncoded: String {
		let customAllowedSet = CharacterSet(charactersIn:"!*'();:@&=+$,/?%#[]").inverted

		return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
	}
	
}
