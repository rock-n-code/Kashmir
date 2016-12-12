//
//  ReachabilityError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

/**
 Representation of the possible error states a `Reachability` instance can have during its execution.

 - **hostNameIsEmpty**: The given host name is an empty string.
 - **hostNameCannotBeUTF8**: The given host name cannot be converted to UTF8 format.
 - **hostAddressIsInvalid**: The given host address is invalid.
 - **referenceIsNil**: The obtained reachability reference is a nil instance.
 - **flagsAreInvalid**: The obtained reachability flags are invalid.
 - **referenceAlreadyObserved**: The reachability reference is already being observed.
 - **referenceNotObserved**: The reachability reference is not being observed.
 - **cannotSetCallback**: The callback function to call on network status changes cannot be set.
 - **cannotResetCallback**: The callback function to call on network status changes cannot be removed.
 - **cannotSetDispatchQueue**: The dispatch queue on which the target should run cannot be set.
 - **cannotResetDispatchQueue**: The dispatch queue on which the target should run cannot be removed.
 */
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
    /// The reachability reference is already being observed.
    case referenceAlreadyObserved
    /// The reachability reference is not being observed.
    case referenceNotObserved
    /// The callback function to call on network status changes cannot be set.
    case cannotSetCallback
    /// The callback function to call on network status changes cannot be removed.
    case cannotResetCallback
    /// The dispatch queue on which the target should run cannot be set.
    case cannotSetDispatchQueue
    /// The dispatch queue on which the target should run cannot be removed.
    case cannotResetDispatchQueue
}
