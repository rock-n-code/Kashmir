//
//  URLResponseError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 29/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

/**
Representation for the error codes defined on the **StatusCode** enumeration of *URLResponse*.
 
* **unauthorizedAccess**: Similar to *forbiddenAccess*, but specifically for use when authentication is required and has failed or has not yet been provided.
* **forbiddenAccess**: The request was a valid request, but the server is refusing to respond to it. The user might be logged in but does not have the necessary permissions for the resource.
* **resourceNotFound**: The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.
* **methodNotAllowed**: A request method is not supported for the requested resource; for example, a GET request on a form which requires data to be presented via POST, or a PUT request on a read-only resource.
* **unprocessableEntity**: The request was well-formed but was unable to be followed due to semantic errors.
* **internalServerError**: A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
*/
public enum URLResponseError: Error {
    /// Similar to *forbiddenAccess*, but specifically for use when authentication is required and has failed or has not yet been provided.
	case unauthorizedAccess
    /// The request was a valid request, but the server is refusing to respond to it. The user might be logged in but does not have the necessary permissions for the resource.
    case forbiddenAccess
    /// The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.
	case resourceNotFound
    /// A request method is not supported for the requested resource; for example, a GET request on a form which requires data to be presented via POST, or a PUT request on a read-only resource.
	case methodNotAllowed
    /// The request was well-formed but was unable to be followed due to semantic errors.
	case unprocessableEntity
    /// A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
	case internalServerError
}
