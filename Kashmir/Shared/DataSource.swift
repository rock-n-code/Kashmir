//
//  DataSource.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 09/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

/// This protocol defines the minimal requirements a compliant data source instance should implement in order to provide data to a view controller.
protocol DataSource: class {
    
    /// Generic placeholder for the data type instances to use as the source from where the data for the data source is generated.
    associatedtype SourceData

    /// Generic placeholder for the section type instances, which must implement the `Sectionable` protocol.
    associatedtype Section: Sectionable
    
    /// Generic placeholder for the item type instances, which must implement the `Itemable` protocol.
    associatedtype Item: Itemable
    
    // MARK: Properties
    
    /// The dictionary that persist in memory both section and item type instances obtained from the `source`.
    var data: [Section: [Item]] { get set }
    
    /// The source of data for the `data` dictionary.
    var sourceData: SourceData? { get set }
    
    var numberOfSections: Int { get }
    
    // MARK: Initializers
    
    /// Default initializer.
    ///
    /// - returns: A pristine data source with an empty `data` dictionary.
    init()
    
    init(data: SourceData)
    
    // MARK: Functions
    
    func update(data updatedData: SourceData)
    
    /// Loads the data from the source into the data dictionary.
    ///
    /// - important: This function is, in fact, a helper function and as such is executed inside the `init(data: )` and the `update(data: )` functions and it **must not** be called outside that scope at all.
    /// - remarks: While implementing this function, the developer has to create the `Section` and the `Items` instances as he/she needs based on his/her data requirements.
    func load()
    
    func numberOfItems(at sectionIndex: Int) throws -> Int
    
    func items(at sectionIndex: Int) throws -> [Item]
    
    func items(at indexPaths: [IndexPath]) throws -> [Item]
    
    func section(at sectionIndex: Int) throws -> Section

    func item(at indexPath: IndexPath) throws -> Item

}

// MARK: -

extension DataSource {
    
    // MARK: Properties
    
    /// The number of sections on the dictionary.
    var numberOfSections: Int {
        return data.keys.count
    }
    
    // MARK: Initializers
    
    /// Recommended initializer.
    ///
    /// - important: This initializer **must** be used in order to populate the `data` dictionary.
    /// - parameter data: An source data instance which is mapped from a JSON response.
    /// - returns: A data source with a dictionary filled with sections and theirs respective items.
    init(data: SourceData) {
        self.init()
        
        self.data = [:]
        self.sourceData = data
        
        load()
    }
    
    // MARK: Functions
    
    /// Updates the data of the data source.
    ///
    /// - important: This function **must** be used in order to update the `data` dictionary.
    /// - parameter data: An source data instance which is mapped from a JSON response.
    func update(data updatedData: SourceData) {
        self.data = [:]
        sourceData = updatedData

        load()
    }
    
    /// Gets the number of items within a section given its index position.
    ///
    /// - parameter at: The index position of a `Section` instance.
    /// - throws: A `DataSourceError` type error is thrown if any error is catched during the execution of this function.
    /// - returns: The number of items within the given section.
    func numberOfItems(at sectionIndex: Int) throws -> Int {
        guard numberOfSections > 0 else {
            return 0
        }
        
        let section = try self.section(at: sectionIndex)
        let items = data[section]!

        return items.count
    }

    /// Creates an array of items within a section given its index position.
    ///
    /// - parameter at: The index position of a `Section` instance.
    /// - throws: A `DataSourceError` type error is thrown if any error is catched during the execution of this function.
    /// - returns: An array of items within the given section.
    func items(at sectionIndex: Int) throws -> [Item] {
        guard try numberOfItems(at: sectionIndex) > 0 else {
            throw DataSourceError.itemsEmpty
        }
        
        let section = try self.section(at: sectionIndex)
        
        return data[section]!
    }
    
    /// Creates an array of items with given array of indexPaths.
    ///
    /// - parameter at: An array of indexPaths.
    /// - throws: A `DataSourceError` type error is thrown if any error is catched during the execution of this function.
    /// - returns: An array of items within the given array of indexPaths.
    func items(at indexPaths: [IndexPath]) throws -> [Item] {
        var items = [Item]()
        
        for indexPath in indexPaths {
            guard try numberOfItems(at: indexPath.section) > 0 else {
                throw DataSourceError.itemsEmpty
            }
            
            let item = try self.item(at: indexPath)
            
            items.append(item)
        }
        
        return items
    }
    
    /// Gets a section instance given its index position.
    ///
    /// - parameter at: The index position of a `Section` instance
    /// - throws: A `DataSourceError` type error is thrown if any error is catched during the execution of this function.
    /// - returns: A `Section` instance based on the given index position.
    func section(at sectionIndex: Int) throws -> Section {
        guard numberOfSections > 0 else {
            throw DataSourceError.sectionsEmpty
        }
        guard sectionIndex <= numberOfSections - 1 else {
            throw DataSourceError.sectionIndexOutOfBounds
        }
        
        return data.keys.filter({ $0.index == sectionIndex }).first!
    }
    
    /// Gets an item instance given an index path.
    ///
    /// - parameter at: An index path indicating a both a position in the section and its respective items array.
    /// - throws: A `DataSourceError` type error is thrown if any error is catched during the execution of this function.
    /// - returns: An `Item` instance based on the given index path.
    func item(at indexPath: IndexPath) throws -> Item {
        guard try numberOfItems(at: indexPath.section) > 0 else {
            throw DataSourceError.itemsEmpty
        }
        
        let section = try self.section(at: indexPath.section)
        let items = data[section]!
        
        guard indexPath.item <= items.count - 1 else {
            throw DataSourceError.itemIndexOutOfBounds
        }
        
        return items[indexPath.item]
    }
}
