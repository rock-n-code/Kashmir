//
//  DataStackStore.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 04/01/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import CoreData

public extension DataStack {
    
    /**
     Representation of the possible types of stores supported by the containers used in a `DataStack` instance.
     
     * **sql**: The SQLite database store type.
     * **xml**: The XML store type.
     * **binary**: The binary store type.
     * **inMemory**: The in-memory store type.
    */
    public enum Store {
        /// The SQLite database store type.
        case sql
        /// The XML store type.
        case xml
        /// The binary store type.
        case binary
        /// The in-memory store type.
        case inMemory
        
        // MARK: Properties
        
        /// Gets the associated value from the selected case.
        var rawValue: String {
            switch self {
                case .sql:
                    return NSSQLiteStoreType
                case .xml:
                    #if os(OSX)
                    return NSXMLStoreType
                    #else
                    return NSSQLiteStoreType
                    #endif
                case .binary:
                    return NSBinaryStoreType
                default:
                    return NSInMemoryStoreType
            }
        }
        
        /// Gets the associated file extension value from the selected case.
        var extensionValue: String {
            switch self {
                case .sql:
                    return "sqlite"
                case .xml:
                    return "xml"
                case .binary:
                    return "bin"
                default:
                    return ""
            }
        }
    }
    
}
