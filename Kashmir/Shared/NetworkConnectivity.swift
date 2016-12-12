//
//  NetworkConnectivity.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 28/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

extension Network {
    
    // MARK: Enumerations
    
    /**
    Representation of the possible network connectivity modems on macOS, iOS and tvOS devices.
    
    * **wifi**: The WiFi modem.
    * **wwan**: The WWAN modem on iOS devices.
    * **any**: Any other modem used for Internet connection.
    */
    public enum Connectivity {
        /// The WiFi modem.
        case wifi
        /// The WWAN modem on iOS devices.
        case wwan
        /// Any other modem used for Internet connection.
        case any
    }

}
