//
//  BundleExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 26/08/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

extension Bundle {

	// MARK: - Functions

	static func url(forResource named: String, withExtension fileExtension: String? = nil) -> URL? {
		var url: URL?

		for framework in allFrameworks {
			url = framework.url(forResource: named, withExtension: fileExtension)

			guard url == nil
			else {
				return url
			}
		}

		for bundle in allBundles {
			url = bundle.url(forResource: named, withExtension: fileExtension)

			guard url == nil
			else {
				break
			}
		}

		return url
	}


}
