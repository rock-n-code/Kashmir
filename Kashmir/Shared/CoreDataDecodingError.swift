//
//  CoreDataDecodingError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Foundation

public enum CoreDataDecodingError: Error {
	case missingContext(codingPath: [CodingKey])
}
