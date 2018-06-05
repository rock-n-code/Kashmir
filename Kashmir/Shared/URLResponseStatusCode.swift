//
//  URLResponseStatusCode.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension URLResponse {

	// MARK: Enumerations
	
    /**
    Status code numeric enumeration of the status code received from URLResponse for *HTTP/1.1* in a request-response between a client and a server.
     
    * **ok**: (*200*) Standard response for successful HTTP requests.
    * **created**: (*201*) The request has been fulfilled, resulting in the creation of a new resource.
    * **noContest**: (*204*) The server successfully processed the request and is not returning any content.
    * **unauthorized**: (*401*) Similar to *forbidden*, but specifically for use when authentication is required and has failed or has not yet been provided.
    * **forbidden**: (*403*) The request was a valid request, but the server is refusing to respond to it. The user might be logged in but does not have the necessary permissions for the resource.
    * **notFound**: (*404*) The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.
    * **methodNotAllowed**: (*405*) A request method is not supported for the requested resource; for example, a GET request on a form which requires data to be presented via POST, or a PUT request on a read-only resource.
    * **unprocessableEntity**: (*422*) The request was well-formed but was unable to be followed due to semantic errors.
    * **internalServerError**: (*500*) A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
    */
	public enum StatusCode: Int {

		// MARK: 1XX - Informational

		// MARK: 2XX - Success

        /// Standard response for successful HTTP requests.
		case ok = 200
        /// The request has been fulfilled, resulting in the creation of a new resource.
		case created = 201
        /// The server successfully processed the request and is not returning any content.
		case noContent = 204

		// MARK: 3XX - Redirection

		// MARK: 4XX - Client error

        /// Similar to *forbidden*, but specifically for use when authentication is required and has failed or has not yet been provided.
		case unauthorized = 401
        /// The request was a valid request, but the server is refusing to respond to it. The user might be logged in but does not have the necessary permissions for the resource.
		case forbidden = 403
        /// The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.
		case notFound = 404
        /// A request method is not supported for the requested resource; for example, a GET request on a form which requires data to be presented via POST, or a PUT request on a read-only resource.
		case methodNotAllowed = 405
        /// The request was well-formed but was unable to be followed due to semantic errors.
		case unprocessableEntity = 422

		// MARK: 5XX - Server error

        /// A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
		case internalServerError = 500
	}

}
