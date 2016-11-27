//
//  Sectionable.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 09/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

/// This protocol defines the basic implementation of a section item used by the data dictionary within any class that implements the `DataSource` protocol.
protocol Sectionable: DataUnitable, Hashable {
    
    // MARK: Properties
    
    /// The index position of the item within the data dictionary.
    var index: Int { get set }
    
    /// The identifier of the item within the data dictionary.
    ///
    /// - important: In case there is no possible identification string, it is required to stringify the index value.
    var id: String { get set }

}

// MARK: - Hashable

extension Sectionable {
    
    // MARK: Properties
    
    var hashValue: Int {
        return id.hashValue
    }
    
}

// MARK: - Equatable

func ==<S: Sectionable> (lhs: S, rhs: S) -> Bool {
    return  lhs.index == rhs.index && lhs.id == rhs.id
}
