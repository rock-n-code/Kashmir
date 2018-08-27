//
//  FiniteState.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

public protocol FiniteState {
	
	// MARK: Static
	
	static var startState: Self { get }
	
	// MARK: Properties
	
	var isFinalState: Bool { get }
	
	var nextState: Self? { get }

	// MARK: Functions
	
	func canTransit(toState state: Self) -> Bool
	
}
