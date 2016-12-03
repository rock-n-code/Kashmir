//
//  SCNetworkReachabilityFlagsExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import SystemConfiguration

public extension SCNetworkReachabilityFlags {
    
    /// Checks if the `reachable` flag is included.
    var isReachable: Bool {
        return contains(.reachable)
    }
    
    /// Checks if the `connectionRequired` flag is included.
    var isConnectionRequired: Bool {
        return contains(.connectionRequired)
    }
    
    /// Checks if the `interventionRequired` flag is included.
    var isInterventionRequired: Bool {
        return contains(.interventionRequired)
    }
    
    /// Checks if the `connectionOnTraffic` flag is included.
    var isConnectionOnTraffic: Bool {
        return contains(.connectionOnTraffic)
    }
    
    /// Checks if the `connectionOnDemand` flag is included.
    var isConnectionOnDemand: Bool {
        return contains(.connectionOnDemand)
    }
    
    /// Checks if the `transientConnection` flag is included.
    var isTransientConnection: Bool {
        return contains(.transientConnection)
    }
    
    /// Checks if the `isLocalAddress` flag is included.
    var isALocalAddress: Bool {
        return contains(.isLocalAddress)
    }
    
    /// Checks if the `isDirectConnection` flag is included.
    var isDirectConnection: Bool {
        return contains(.isDirect)
    }
    
    /// Checks if either the `connectionOnTraffic` flag or the `connectionOnDemand` flag is included.
    var isConnectionOnTrafficOrDemand: Bool {
        return isConnectionOnTraffic || isConnectionOnDemand
    }
    
    /// Checks if either the `connectionRequired` flag or the `transientConnection` flag is included.
    var isConnectionRequiredOrTransient: Bool {
        return isConnectionRequired || isTransientConnection
    }
    
    /// Checks if the `reachable` flag is included while the `connectionRequired` flag is not included.
    var isConnected: Bool {
        return isReachable && !isConnectionRequired
    }
    
    /// Checks if the `isWWAN` flag in included.
    ///
    /// - note: The `isWWAN` flag only exists on the **iOS** platform, on other platforms the value `false` is returned.
    var isOnWWAN: Bool {
        #if os(iOS)
            return contains(.isWWAN)
        #else
            return false
        #endif
    }
    
    /// Checks if a device is able to connect to the network via a WWAN modem.
    ///
    /// - note: The WWAN modems are used by **iOS** devices only, on other types of devices it just checks if the device is able to connect to the network.
    var isReachableViaWWAN: Bool {
        #if os(iOS)
            return isConnected && isOnWWAN
        #else
            return isReachable
        #endif
    }
    
    /// Checks if a device is able to connect to the network via a WiFi modem.
    var isReachableViaWiFi: Bool {
        #if os(iOS)
            return isConnected && !isOnWWAN
        #else
            return isConnected
        #endif
    }
    
}
