//
//  BiometricError.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 18/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

/**
Representation of the possible error types that can be encountered during the Biometric authentication process.
*/
public enum BiometricError: Error {
	/// Biometric authentication is not supported by the device.
	case notSupported
	/// The user has not enrolled any identity to the biometric authentication option.
	case notEnrolled
	/// Biometric authentication is not available on the device.
	case notAvailable
	/// Passcode has not been set by the user.
	case passNotSet
	/// Biometric authentication context has been invalidated.
	case contextInvalidated
	/// Biometric authentication failed due to requiring a forbidden UI.
	case notInteractive
	/// Biometric authentication failed due to invalid credentials.
	case authFailed
	/// Biometric authentication has been locked out due to too many failed attempts to authenticate a user.
	case lockedOut
	/// Biometric authentication has been cancelled either by the system, the app or the user.
	case cancelled
	/// Biometric authentication has been cancelled due to the user tapped the fallback button ("enter password")
	case fallbacked
	/// An unknown error happened.
	case unknown
}
