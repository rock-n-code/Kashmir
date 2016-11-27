//
//  DataSourceError.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 09/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation

/// Representation of the possible error states a `DataSouce` can have during execution.
///
/// * **sectionsEmpty**: The sections' array is empty.
/// * **sectionMistaken**: The given section is not required.
/// * **sectionIndexOutOfBounds**: The given index position on the sections' array is out of bounds.
/// * **itemsEmpty**: The items' array is empty.
/// * **itemIndexOutOfBounds**: The given index position on the items' array is out of bounds.
enum DataSourceError: Error {
    /// The sections' array is empty.
    case sectionsEmpty
    /// The given section is not required.
    case sectionNotRequired
    /// The given index position on the sections' array is out of bounds.
    case sectionIndexOutOfBounds
    /// The items' array is empty.
    case itemsEmpty
    /// The given index position on the items' array is out of bounds.
    case itemIndexOutOfBounds
}