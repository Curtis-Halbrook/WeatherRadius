//
//  WeatherRepository.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation
import CoreLocation

public protocol WeatherRepository {
    
    /// Gets weather for a given location
    ///
    /// This Repository is the main mechanism for fetching weather information.
    /// Passing a coordinate will call out to our endpoint, and that value will
    /// then be saved in our Datastore.  Future calls for the same coordinate (
    /// to three significant digits) will fetch the cached value as long as it
    /// is newer that the duration limit as requested by the Weather Cache
    /// Duration Provider.
    ///
    /// - parameters:
    ///     - at coordinate: A valid CLLocationCoordinate2D instance
    ///
    /// - returns: An optional WeatherConditions object if one is available
    ///
    /// - throws: WeatherError 
    ///
    func getWeather(
        at coordinate: CLLocationCoordinate2D
    ) async throws -> WeatherConditions?
    
}
