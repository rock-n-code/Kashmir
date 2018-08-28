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

	// MARK: Properties
	
	var stateController: StateMachineController<State> { get set }
	
	// MARK: Functions

	func handle(_ state: FiniteMachineState<State>)
	
}

// MARK: -

extension StateMachineHandler {
	
	// MARK: Functions
	
	func start() {
		stateController.start()
	}
	
	func retry() {
		stateController.retry()
	}
	
}
