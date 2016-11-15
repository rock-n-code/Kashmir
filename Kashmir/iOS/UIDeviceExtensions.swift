//
//  UIDeviceExtensions.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 31/10/2016.
//  Copyright © 2016 KLM. All rights reserved.
//

import UIKit

extension UIDevice {
    
    // MARK: Properties

    /// Gets the version number of the `UIDevice` instance's operating system.
    public var version: Float {
        return Float(UIDevice.current.systemVersion)!
    }
    
    /// Check if the current device is in portrait mode.
    ///
    /// - important: This method checks for the orientation state of the device's status bar instead of checking the `UIDevice` instance's orientation.
    public var isPortrait: Bool {
        return UIApplication.shared.statusBarOrientation.isPortrait
    }
    
    /// Check if the current device is in landscape mode.
    ///
    /// - important: This method checks for the orientation state of the device's status bar instead of checking the `UIDevice` instance's orientation.
    public var isLandscape: Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }

}