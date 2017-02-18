//
//  Itemable.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 09/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

/**
This protocol defines the basic implementation of a item inside the item's array used by the data dictionary within any class that implements the `DataSource` protocol.
*/
public protocol Itemable: CustomStringConvertible, CustomDebugStringConvertible {}
