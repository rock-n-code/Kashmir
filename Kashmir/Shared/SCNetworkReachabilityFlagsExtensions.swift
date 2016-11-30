//
//  SCNetworkReachabilityFlagsExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import SystemConfiguration

public extension SCNetworkReachabilityFlags {
    
    var isReachable: Bool {
        return contains(.reachable)
    }
    
    var isConnectionRequired: Bool {
        return contains(.connectionRequired)
    }
    
    var isInterventionRequired: Bool {
        return contains(.interventionRequired)
    }
    
    var isConnectionOnTraffic: Bool {
        return contains(.connectionOnTraffic)
    }
    
    var isConnectionOnDemand: Bool {
        return contains(.connectionOnDemand)
    }
    
    var isTransientConnection: Bool {
        return contains(.transientConnection)
    }
    
    var isALocalAddress: Bool {
        return contains(.isLocalAddress)
    }
    
    var isDirectConnection: Bool {
        return contains(.isDirect)
    }
    
    var isConnectionOnTrafficOrDemand: Bool {
        return isConnectionOnTraffic || isConnectionOnDemand
    }
    
    var isConnectionRequiredOrTransient: Bool {
        return isConnectionRequired || isTransientConnection
    }
    
    var isConnected: Bool {
        return isReachable && !isConnectionRequired
    }
    
    var isOnWWAN: Bool {
        #if os(iOS)
            return contains(.isWWAN)
        #else
            return false
        #endif
    }
    
    var isReachableViaWWAN: Bool {
        #if os(iOS)
            return isConnected && isOnWWAN
        #else
            return isReachable
        #endif
    }
    
    var isReachableViaWiFi: Bool {
        #if os(iOS)
            return isConnected && !isOnWWAN
        #else
            return isConnected
        #endif
    }
    
}
