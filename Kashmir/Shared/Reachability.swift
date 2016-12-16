//
//  Reachability.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 27/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

/**
 This manager uses `Network.Reacher` instances to check on the network state of a device.
*/
public class Reachability {
    
    // MARK: Properties
    
    /// Provides the manager instance.
    public static let manager = Reachability()
    
    /**
    Checks if the device have any access to an Internet connection.
    
    - note: This function uses the 0.0.0.0 (IPv4) address as a special token that indicates to check the general routing status of the device.
    */
    public var haveInternetConnection: Bool {
        var zeroAddress = sockaddr_in()
        
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let reacher = Network.Reacher(address: zeroAddress) else {
            return false
        }
        
        do {
            return try reacher.connectivity() != .notReachable
        }
        catch {
            return false
        }
    }
    
    // MARK: Initialisations
    
    fileprivate init() {}

}
