//
//  URLResponseStatusCode.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension URLResponse {

	public enum StatusCode: Int {

		// 1XX: Informational

		// 2XX: Success

		case ok = 200
		case created = 201
		case noContest = 204

		// 3XX: Redirection

		// 4XX: Client error

		case unauthorized = 401
		case forbidden = 403
		case notFound = 404
		case methodNotAllowed = 405
		case unprocessableEntity = 422

		// 5XX: Server error

		case internalServerError = 500
	}

}
