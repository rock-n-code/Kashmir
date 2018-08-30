//
//  FiniteMachineState.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

public enum FiniteMachineState<S: FiniteState & Equatable> {
	case none
	case start
	case transit(S)
	case finish
	case error(Error?)
}

// MARK: - Equatable

extension FiniteMachineState: Equatable {

	// MARK: Static
	
	public static func == (lhs: FiniteMachineState<S>,
						   rhs: FiniteMachineState<S>) -> Bool {
		switch (lhs, rhs) {
		case (.none, .none),
			 (.start, .start),
			 (.finish, .finish),
			 (.error(_), .error(_)):
			return true
		case (.transit(let ls), .transit(let rs)):
			return ls == rs
		default:
			return false
		}
	}
	
}
