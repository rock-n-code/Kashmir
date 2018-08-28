//
//  StateMachineHandler.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

public protocol StateMachineHandler: class {
	
	// MARK: Associated types
	
	associatedtype State: FiniteState, Equatable

	// MARK: Functions

	func handle(_ state: FiniteMachineState<State>)
	
}
