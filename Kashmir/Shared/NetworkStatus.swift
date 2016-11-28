//
//  NetworkStatus.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import SystemConfiguration

extension Network {
    
    // MARK: Enumerations
    
    /// Representatiobn of the possible network statuses on macOS, iOS and tvOS devices.
    ///
    /// - **notReachable**: The Internet connection is not reachable by any of the connectivity modems.
    /// - **reachable**: The Internet connection is reachable via a defined connectivity modem.
    public enum Status {
        /// The Internet connection is not reachable by any of the connectivity modems.
        case notReachable
        /// The Internet connection is reachable via a defined connectivity modem.
        case reachable(Network.Connectivity)
        
        // MARK: Initializations
        
        /// Initializer with network reachability flags.
        ///
        /// - Parameter flags: A set of flags provided by the network reachability check.
        public init(flags: SCNetworkReachabilityFlags) {
            switch flags {
            case _ where flags.isReachableViaWiFi:
                self = .reachable(.wifi)
            case _ where flags.isReachableViaWWAN:
                #if os(iOS)
                    self = .reachable(.wwan)
                #else
                    self = .reachable(.any)
                #endif
            default:
                self = .notReachable
            }
        }
    }
    
}

// MARK: - Equatable

extension Network.Status: Equatable {
    
    // MARK: Functions
    
    public static func == (lhs: Network.Status, rhs: Network.Status) -> Bool {
        switch (lhs, rhs) {
            case (.notReachable, .notReachable): return true
            case let (.reachable(lhsConnectivity), .reachable(rhsConnectivity)): return lhsConnectivity == rhsConnectivity
            default: return false
        }
    }
}

