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
	static var endStates: [Self] { get }
	static var shouldStartAutomatically: Bool { get }
	static var shouldEndAutomatically: Bool { get }
	static var shouldRetryFromStart: Bool { get }
	
	// MARK: Properties

	var nextState: Self? { get }

	// MARK: Functions
	
	func canTransit(toState state: Self) -> Bool
	
}

// MARK: - Equatable

extension FiniteState where Self: Equatable {
	
	// MARK: Properties
	
	var isEndState: Bool {
		return Self.endStates.contains { state in
			self == state
		}
	}
	
}
