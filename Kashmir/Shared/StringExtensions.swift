//
//  StringExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension String {

	// MARK: - Properties

	public func urlEncoded() -> String {
		let customAllowedSet = CharacterSet(charactersIn:"!*'();:@&=+$,/?%#[]").inverted

		return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
	}
	
}
