//
//  IndexPathExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 26/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

public extension IndexPath {
    
    // MARK: Properties
	
	/**
	Creates a new index path positioned at a previous section if possible.
    
	- note: The new `IndexPath` instance is generated out of the same item number but a decreased section number from the current index path.
	*/
    var previousSection: IndexPath? {
        guard section > 0  else {
            return nil
        }
        
        return IndexPath(item: item, section: section - 1)
    }
	
	/**
	Creates a new index path positioned at a previous item if possible.
    
	- note: The new `IndexPath` instance is generated out of the same section number but a decreased item number from the current index path.
	*/
    var previousItem: IndexPath? {
        guard item > 0 else {
            return nil
        }

        return IndexPath(item: item - 1, section: section)
    }
	
	/**
	Creates a new index path positioned at a next section.
    
	- note: The new `IndexPath` instance is generated out of the same item number but an increased section number from the current index path.
	*/
    var nextSection: IndexPath {
        return IndexPath(item: item, section: section + 1)
    }
	
	/**
	Creates a new index path positioned at a next item.
    
	- note: The new `IndexPath` instance is generated out of the same section number but an increased item number from the current index path.
	*/
    var nextItem: IndexPath {
        return IndexPath(item: item + 1, section: section)
    }
    
}
