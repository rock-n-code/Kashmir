//
//  TestLogicController.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 28/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import Kashmir

class TestLogicController {
	
	// MARK: Properties
	
	var stateController: StateMachineController<TestFiniteState>
	
	// MARK: Initializers
	
	init() {
		self.stateController = StateMachineController<TestFiniteState>()
	}
	
}

// MARK: - StateMachineHandler

extension TestLogicController: StateMachineHandler {

	// MARK: Types
	
	typealias State = TestFiniteState
	
	// MARK: Functions
	
	func handle(_ state: FiniteMachineState<TestFiniteState>) {
		return
	}
	
}
