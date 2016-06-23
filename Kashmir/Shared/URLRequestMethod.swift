//
//  URLRequestMethod.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 23/06/16.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension URLRequest {

	public enum Method: String {
		case get
		case head
		case post
		case put
		case delete
		case patch
		case connect
		case options
		case trace

		// MARK: - Properties

		public var rawValue: String {
			return "\(self)".uppercased()
		}
	}

}
