//
//  FiniteMachineState.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 27/08/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

internal enum FiniteMachineState<T: FiniteState> {
	case none
	case start
	case transit(T)
	case finish
	case error(Error?)
}
