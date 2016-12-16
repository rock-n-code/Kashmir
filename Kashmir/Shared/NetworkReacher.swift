//
//  NetworkReacher.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 30/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import Foundation
import SystemConfiguration

typealias NetworkStatusExecutionBlock = (Network.Status) -> ()

extension Network {
    
    /**
    This class is a useful wrapper to the `SCNetworkReachability` programming interface.
    */
    class Reacher {
        
        // MARK: Properties
        
        /// The execution block to be called when a change of network status is detected.
        var onStatusChanged: NetworkStatusExecutionBlock?
        
        /// The reachability handle to a network host or address.
        private (set) var reference: SCNetworkReachability
        
        /// The dispatch queue on which the target should run.
        private (set) var queue: DispatchQueue?
        
        /// The flag that defines if the class is observing for network changes or not.
        private (set) var isObserving: Bool

        // MARK: Initializations
        
        /**
        Initializer for a host name.
         
        - parameter host: The host name to check for reachability.
        */
        init?(host: String) {
            guard !host.isEmpty,
                let utf8String = (host as NSString).utf8String,
                let reference = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, utf8String)
            else {
                return nil
            }
            
            self.reference = reference
            self.isObserving = false
        }
        
        /**
        Initializer for an IP v4 network address.

        - parameter address: The network address to check for reachability.
        */
        init?(address: sockaddr_in) {
            var ipV4Address = address
            
            guard let reference = withUnsafePointer(to: &ipV4Address, {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, $0)
                }
            }) else {
                return nil
            }
            
            self.reference = reference
            self.isObserving = false
        }
        
        /**
        Initializer for an IP v6 network address.
         
        - parameter address: The network address to check for reachability.
        */
        init?(address: sockaddr_in6) {
            var ipV6Address = address
            
            guard let reference = withUnsafePointer(to: &ipV6Address, {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, $0)
                }
            }) else {
                return nil
            }
            
            self.reference = reference
            self.isObserving = false
        }
        
        /**
        Default de-initializer.
        */
        deinit {
            do {
                try unobserve()
            }
            catch {}
        }
        
        // MARK: Functions
        
        /**
        Determines the current network status configuration and the reachability of a target synchronously.

        - important: This function does not guarantee that any data packet will be received by the target.
        - throws: A `ReachabilityError` type error in case during the execution of this function.
        - returns: The current network status of a device.
        */
        func connectivity() throws -> Network.Status {
            var flags = SCNetworkReachabilityFlags()
            
            guard withUnsafeMutablePointer(to: &flags, {
                SCNetworkReachabilityGetFlags(reference, UnsafeMutablePointer($0))
            }) else {
                throw ReachabilityError.flagsAreInvalid
            }
            
            return Network.Status(flags: flags)
        }
        
        /**
        Registers the observer that monitor asynchronously the current network status configuration and the reachability of a target.
        
        - note: The `onStatusChanged` property will be execute in each and every time a network status change is detected.
        - important: This function does not guarantee that any data packet will be received by the target.
        - throws: A `ReachabilityError` type error in case during the execution of this function.
        */
        func observe() throws {
            guard !isObserving else {
                throw ReachabilityError.referenceAlreadyObserved
            }

            queue = DispatchQueue(label: "com.rockncode.kashmir.network.reacher")
            
            var context = SCNetworkReachabilityContext(version: 0, info: UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()), retain: nil, release: nil, copyDescription: nil)
            
            defer {
                isObserving = true
            }
            
            guard SCNetworkReachabilitySetCallback(reference, { target, flags, info in
                guard let info = info else {
                    // TODO: Handle error.
                    return
                }

                let reacher = Unmanaged<AnyObject>.fromOpaque(info).takeUnretainedValue() as! Reacher
                let status = Network.Status(flags: flags)
                
                if let block = reacher.onStatusChanged {
                    block(status)
                }
            }, &context) else {
                throw ReachabilityError.cannotSetCallback
            }
            guard SCNetworkReachabilitySetDispatchQueue(reference, queue) else {
                throw ReachabilityError.cannotSetDispatchQueue
            }
        }
        
        /**
        Unregisters the observer that monitor asynchronously the current network status configuration and the reachability of a target.
        
        - throws: A `ReachabilityError` type error in case during the execution of this function.
        */
        func unobserve() throws {
            defer {
                isObserving = false
                queue = nil
            }
            
            guard isObserving else {
                throw ReachabilityError.referenceNotObserved
            }
            guard SCNetworkReachabilitySetCallback(reference, nil, nil) else {
                throw ReachabilityError.cannotResetCallback
            }
            guard SCNetworkReachabilitySetDispatchQueue(reference, nil) else {
                throw ReachabilityError.cannotResetDispatchQueue
            }
        }
    }
    
}
