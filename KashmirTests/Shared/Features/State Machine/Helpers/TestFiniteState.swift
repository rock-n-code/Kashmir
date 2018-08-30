//
//  TestFiniteState.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 28/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Kashmir

enum TestFiniteState: Equatable {
	case firstState
	case secondState
	case thirdState
}

// MARK: - FiniteState

extension TestFiniteState: FiniteState {
	
	// MARK: Static
	
	static var startState: TestFiniteState {
		return .firstState
	}
	
	static var endState: TestFiniteState {
		return .thirdState
	}
	
	static var shouldStartAutomatically: Bool {
		return false
	}

	static var shouldRetryFromStart: Bool {
		return false
	}
	
	// MARK: Properties
	
	var nextState: TestFiniteState? {
		switch self {
		case .firstState:
			return .secondState
		case .secondState:
			return .thirdState
		default:
			return nil
		}
	}
	
	// MARK: Functions
	
	func canTransit(toState state: TestFiniteState) -> Bool {
		switch (self, state) {
		case (.firstState, .secondState),
			 (.secondState, .thirdState):
			return true
		default:
			return false
		}
	}
	
}
