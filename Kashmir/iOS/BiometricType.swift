//
//  BiometricType.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 18/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

/**
Representation of the possible types supported by the Biometric authentication.
*/
public enum BiometricType {
	/// No biometric type supported.
	case none
	/// Touch ID biometric authentication supported.
	case touchID
	/// Face ID biometric authentication supported.
	case faceID
}
