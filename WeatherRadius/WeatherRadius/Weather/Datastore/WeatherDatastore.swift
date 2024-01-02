//
//  WeatherDatastore.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation
import CoreLocation

protocol WeatherDatastore {
    
    /// Gets saved weather for a given coordinate, if any
    ///
    /// - parameters:
    ///     - at coordinate: The CLLocationCoordinate2D position of the data
    ///
    ///
    /// - returns: An optional WeatherConditions object, if WX data has been
    ///            saved.
    func getWeather(
        at coordinate: CLLocationCoordinate2D
    ) async -> WeatherConditions?
    
    /// Saves a WeatherConditions object at a given location
    ///
    /// - parameters:
    ///     - _ weather: The WeatherCondition object to ave
    ///     - at coordinate: The position this weather information refers
    ///
    func saveWeather(
        _ weather: WeatherConditions,
        at coordinate: CLLocationCoordinate2D
    ) async
}
