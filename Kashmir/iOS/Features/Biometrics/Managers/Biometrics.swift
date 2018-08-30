//
//  Biometrics.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 18/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import LocalAuthentication

/**
Biometric authentication manager.
*/
public class Biometrics {
	
	// MARK: Types
	
	public typealias BiometricsAuthenticationBlock = (Result<Bool>) -> ()

	// MARK: Properties

	/// Gets the list of possible biometric types available for authentication.
	public var supportedTypes: [BiometricType] {
		return [.touchID,
				.faceID]
	}
	
	/// Get the biometric type available (if any) for authentication in a device.
	public var supportedType: BiometricType {
		context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
								  error: nil)
		
		switch context.biometryType {
		case .faceID:
			return .faceID
		case .touchID:
			return .touchID
		case .none:
			return .none
		}
	}

	/// Checks if biometric authentication is supported by a device.
	public var isSupported: Bool {
		return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
										 error: nil)
	}

	/// Checks if biometric authentication is activated and supported, meaning it is available for use.
	public var isAvailable: Bool {
		return isActivated && isSupported
	}

	/// Checks if biometric authentication is activated by the application.
	public var isActivated: Bool

	/// Persists the local authentication context used by this manager.
	private let context: LAContext
	
	// MARK: Initializers
	
	private init() {
		self.context = LAContext()
		self.isActivated = false
	}
	
	// MARK: Static
	
	/// Returns the public interface of this manager.
	public static let manager = Biometrics()
	
	// MARK: Functions
	
	/**
	Authenticates a user (if possible) by any available biometric mechanism in a device.
	
	- parameter completion: this block returns an error if something happens during the biometric authentication, otherwise it returns nil.
	*/
	public func authenticate(_ completion: @escaping BiometricsAuthenticationBlock) {
		guard isSupported else {
			completion(Result<Bool> {
				throw BiometricError.notSupported
			})
			return
		}
		
		context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
							   localizedReason: "xxx") { isSuccess, error in
			guard let error = error else {
				completion(Result<Bool> {
					return isSuccess
				})
				return
			}
			
			completion(Result<Bool> {
				throw self.handle(error)
			})
		}
	}

	// MARK: Helpers
	
	/**
	Handles the error received from the biometric authentication.
	
	- parameter error: An error of `Error` type.
	- returns: An error of `BiometricError` type.
	*/
	private func handle(_ error: Error) -> BiometricError {
		switch error {
		case LAError.authenticationFailed:
			return .authFailed
		case LAError.appCancel,
			 LAError.systemCancel,
			 LAError.userCancel:
			return .cancelled
		case LAError.biometryLockout:
			return .lockedOut
		case LAError.biometryNotAvailable:
			return .notAvailable
		case LAError.biometryNotEnrolled:
			return .notEnrolled
		case LAError.invalidContext:
			return .contextInvalidated
		case LAError.notInteractive:
			return .notInteractive
		case LAError.passcodeNotSet:
			return .passNotSet
		case LAError.userFallback:
			return .fallbacked
		default:
			return .unknown
		}
	}
	
}
