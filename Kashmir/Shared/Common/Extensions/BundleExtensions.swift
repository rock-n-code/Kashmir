//
//  BundleExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 26/08/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

public extension Bundle {

	// MARK: Functions

    /**
	Search for the first appearance of a file within all the declared frameworks and bundles and provide a URL containing the physical location of the requested file in case it is found.
    
    - parameters:
         - resource: The name of the file to search.
         - fileExtension: The file extension of the file to search (if any).
	- returns: A *URL* containing the physical location of the requested file in case it is actually found.
    */
	static func url(for resource: String, with fileExtension: String? = nil) -> URL? {
		var url: URL?

		for framework in allFrameworks {
			url = framework.url(forResource: resource, withExtension: fileExtension)

			guard url == nil else {
				return url
			}
		}

		for bundle in allBundles {
			url = bundle.url(forResource: resource, withExtension: fileExtension)

			guard url == nil else {
				break
			}
		}

		return url
	}

    /**
    Search for the all the appearances of a file within all the declared frameworks and bundles and provide an array of URLs containing the physical locations of the requested file in case it is found.
    
    - parameters:
         - resource: The name of the file to search.
         - fileExtension: The file extension of the file to search (if any).
	- returns: An array of *URL* containing the physical locations of the requested file in case it is actually found. Otherwise it returns an empty array.
    */
	static func urls(for resource: String, with fileExtension: String? = nil) -> [URL] {
		var urls = [URL]()

		for framework in allFrameworks {
			if let url = framework.url(forResource: resource, withExtension: fileExtension) {
				urls.append(url)
			}
		}

		for bundle in allBundles {
			if let url = bundle.url(forResource: resource, withExtension: fileExtension) {
				urls.append(url)
			}
		}

		return urls
	}

}
