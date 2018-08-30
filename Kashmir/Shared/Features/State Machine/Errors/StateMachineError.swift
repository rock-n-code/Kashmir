//
//  StateMachineError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

public enum StateMachineError: Error {
	case cannotExecuteStart
	case cannotExecuteTransit
	case cannotExecuteRetry
	case cannotTransitToNewState
}
