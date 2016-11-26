//
//  URLRequestMethod.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension URLRequest {

	// MARK: Enumerations

	/// HTTP Method strings enumeration of the request methods to use with URLRequest for *HTTP/1.1* in a request-response between a client and a server.
	///
	/// - **get**: The GET method requests a representation of the specified resource. Requests using GET should only retrieve data and should have no other effect.
	/// - **head**: The HEAD method asks for a response identical to that of a GET request, but without the response body. This is useful for retrieving meta-information written in response headers, without having to transport the entire content.
	/// - **post**: The POST method requests that the server accept the entity enclosed in the request as a new subordinate of the web resource identified by the URI. The data POSTed might be, for example, an annotation for existing resources; a message for a bulletin board, newsgroup, mailing list, or comment thread; a block of data that is the result of submitting a web form to a data-handling process; or an item to add to a database.
	/// - **put**: The PUT method requests that the enclosed entity be stored under the supplied URI. If the URI refers to an already existing resource, it is modified; if the URI does not point to an existing resource, then the server can create the resource with that URI.
	/// - **delete**: The DELETE method deletes the specified resource.
	/// - **patch**: The PATCH method applies partial modifications to a resource.
	/// - **connect**: The CONNECT method converts the request connection to a transparent TCP/IP tunnel, usually to facilitate SSL-encrypted communication (HTTPS) through an unencrypted HTTP proxy.
	/// - **options**: The OPTIONS method returns the HTTP methods that the server supports for the specified URL. This can be used to check the functionality of a web server by requesting '*' instead of a specific resource.
	/// - **trace**: The TRACE method echoes the received request so that a client can see what (if any) changes or additions have been made by intermediate servers.
	public enum Method: String {
        /// The GET method requests a representation of the specified resource. Requests using GET should only retrieve data and should have no other effect.
		case get
        /// The HEAD method asks for a response identical to that of a GET request, but without the response body. This is useful for retrieving meta-information written in response headers, without having to transport the entire content.
		case head
        /// The POST method requests that the server accept the entity enclosed in the request as a new subordinate of the web resource identified by the URI. The data POSTed might be, for example, an annotation for existing resources; a message for a bulletin board, newsgroup, mailing list, or comment thread; a block of data that is the result of submitting a web form to a data-handling process; or an item to add to a database.
		case post
        /// The PUT method requests that the enclosed entity be stored under the supplied URI. If the URI refers to an already existing resource, it is modified; if the URI does not point to an existing resource, then the server can create the resource with that URI.
		case put
        /// The DELETE method deletes the specified resource.
		case delete
        /// The PATCH method applies partial modifications to a resource.
		case patch
        /// The CONNECT method converts the request connection to a transparent TCP/IP tunnel, usually to facilitate SSL-encrypted communication (HTTPS) through an unencrypted HTTP proxy.
		case connect
        /// The OPTIONS method returns the HTTP methods that the server supports for the specified URL. This can be used to check the functionality of a web server by requesting '*' instead of a specific resource.
		case options
        /// The TRACE method echoes the received request so that a client can see what (if any) changes or additions have been made by intermediate servers.
		case trace

		// MARK: Properties

		/// Provides an uppercased string of the selected case.
		public var rawValue: String {
			return "\(self)".uppercased()
		}
	}

}
