//
//  ReachabilityError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

/// Representation of the possible error states a `Reachability` instance can have during its execution.
///
/// - **hostNameIsEmpty**: The given host name is an empty string.
/// - **hostNameCannotBeUTF8**: The given host name cannot be converted to UTF8 format.
/// - **hostAddressIsInvalid**: The given host address is invalid.
/// - **referenceIsNil**: The obtained reachability reference is a nil instance.
/// - **flagsAreInvalid**: The obtained reachability flags are invalid.
public enum ReachabilityError: Error {
    /// The given host name is an empty string.
    case hostNameIsEmpty
    /// The given host name cannot be converted to UTF8 format.
    case hostNameCannotBeUTF8
    /// The given host address is invalid.
    case hostAddressIsInvalid
    /// The obtained reachability reference is a nil instance.
    case referenceIsNil
    /// The obtained reachability flags are invalid.
    case flagsAreInvalid
}
