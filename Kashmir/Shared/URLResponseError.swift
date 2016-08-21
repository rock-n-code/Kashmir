//
//  URLResponseError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 29/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

public enum URLResponseError: Error {
	case unauthorizedAccess
	case forbiddenAccess
	case resourceNotFound
	case methodNotAllowed
	case unprocessableEntity
	case internalServerError
}
