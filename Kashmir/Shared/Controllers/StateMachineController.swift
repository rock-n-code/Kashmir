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
	
	// MARK: Functions
	
	public func start() {
		switch state {
		case .none:
			change(toState: .start)
		default:
			change(toState: .error(StateMachineError.cannotExecuteStart))
		}
	}
	
	// MARK: Helpers
	
	private func change(toState finiteState: FiniteMachineState<S>) {
		switch finiteState {
		case .start:
			update(toState: finiteState)

			if S.shouldStartAutomatically {
				change(toState: .transit(S.startState))
			}
		case .transit(let transitionalState):
			update(toState: finiteState)
			
			if let nextState = transitionalState.nextState {
				change(toState: .transit(nextState))
			}
			else if transitionalState.isEndState, S.shouldEndAutomatically {
				change(toState: .finish)
			}
		case .finish:
			update(toState: finiteState)
		case .error(_):
			onStateChanged?(finiteState)
		default:
			break
		}
	}
	
	private func update(toState finiteState: FiniteMachineState<S>) {
		state = finiteState
		
		onStateChanged?(state)
	}
	
}
