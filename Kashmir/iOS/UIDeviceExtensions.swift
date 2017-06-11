//
//  UIDeviceExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 31/10/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    // MARK: Properties

    /// Gets the version number of the `UIDevice` instance's operating system.
    var version: Float {
		guard let version = Float(UIDevice.current.systemVersion) else {
			return 0.0
		}
		
		return version
    }
	
	/**
	Check if the current device is in portrait mode.
    
	- important: This method checks for the orientation state of the device's status bar instead of checking the `UIDevice` instance's orientation.
	*/
    var isPortrait: Bool {
        return UIApplication.shared.statusBarOrientation.isPortrait
    }
	
	/**
	Check if the current device is in landscape mode.

	- important: This method checks for the orientation state of the device's status bar instead of checking the `UIDevice` instance's orientation.
	*/
    var isLandscape: Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }

}
