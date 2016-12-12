//
//  Sectionable.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 09/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

/**
This protocol defines the basic implementation of a section item used by the data dictionary within any class that implements the `DataSource` protocol.
*/
public protocol Sectionable: DataUnitable, Hashable {
    
    // MARK: Properties
    
    /// The index position of the item within the data dictionary.
    var index: Int { get set }
    
    /**
    The identifier of the item within the data dictionary.
 
    - important: In case there is no possible identification string, it is required to stringify the index value.
    */
    var id: String { get set }

}

// MARK: - Hashable

public extension Sectionable {
    
    // MARK: Properties
    
    var hashValue: Int {
        return id.hashValue
    }
    
}

// MARK: - Equatable

extension Sectionable {
    
    /**
    Checks if two `Sectionable` instances are equal.
    
    - parameters:
        - lhs: A `Sectionable` instance at the left side of the `==` operator.
        - rhs: A `Sectionable` instance at the right side of the `==` operator.
    - returns: A boolean value that represents if the two given `Sectionable` instances are equal.
    */
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.index == rhs.index && lhs.id == rhs.id
    }
    
}
