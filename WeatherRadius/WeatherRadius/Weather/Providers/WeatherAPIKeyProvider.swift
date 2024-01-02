//
//  WeatherAPIKeyProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/1/24.
//

import Foundation

public protocol WeatherAPIKeyProvider {
    
    /// Gets the API key needed to perform the weather call
    ///
    /// The method is `async` because there is no guarantee that the key will
    /// be local to the device.  If a remote key manager is being used, for
    /// example, it may mean a network call is needed to fetch the key value.
    ///
    /// - returns: A string value of the API key
    ///
    /// - throws: Never
    ///
    func getKey() async -> String
}
