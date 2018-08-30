//
//  OtherFiniteState.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 28/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Kashmir

enum OtherFiniteState: Equatable {
	case firstState
	case secondState
	case thirdState
}

// MARK: - FiniteState

extension OtherFiniteState: FiniteState {

	// MARK: Static
	
	static var startState: OtherFiniteState {
		return .firstState
	}
	
	static var endState: OtherFiniteState {
		return .thirdState
	}
	
	static var shouldStartAutomatically: Bool {
		return true
	}
	
	static var shouldRetryFromStart: Bool {
		return true
	}
	
	// MARK: Properties
	
	var nextState: OtherFiniteState? {
		return nil
	}
	
	// MARK: Functions
	
	func canTransit(toState state: OtherFiniteState) -> Bool {
		switch (self, state) {
		case (.firstState, .secondState),
			 (.secondState, .thirdState):
			return true
		default:
			return false
		}
	}
	
}
