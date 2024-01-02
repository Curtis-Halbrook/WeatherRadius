//
//  WeatherCacheDurationProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation

public protocol WeatherCacheDurationProvider {
    
    /// Returns the number of seconds that WX data should be retained.
    ///
    /// This protocol exists to enable the app to control how long weather
    /// data returned from the endpoint to be held.  This is to reduce frequent
    /// requests for the same data at the same location within a timespan where
    /// it is unlikely to have changed.
    func getCacheDuration() -> TimeInterval
}
