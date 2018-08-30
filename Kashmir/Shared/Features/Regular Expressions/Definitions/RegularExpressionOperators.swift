//
//  Operators.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 19/10/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

// MARK: Regular Expressions

infix operator ~?>: RegExGroup
infix operator ~~>: RegExGroup

// MARK: Precedence Groups

precedencegroup RegExGroup {
	associativity: none
}
