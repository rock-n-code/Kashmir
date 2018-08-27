//
//  StateMachineController.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

public class StateMachineController<S: FiniteState & Equatable> {
	
	// MARK: Types
	
	public typealias StateExecutionBlock = (FiniteMachineState<S>) -> ()
	
	// MARK: Properties
	
	public var onStateChanged: StateExecutionBlock?
	
	internal var state: FiniteMachineState<S>
	
	// MARK: Initializers
	
	public init() {
		self.state = .none
	}
	
	
}
