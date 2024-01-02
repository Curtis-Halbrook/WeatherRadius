//
//  WeatherService.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/1/24.
//

import Foundation
import CoreLocation

protocol WeatherService {
    
    /// Asynchronously requests weather information at the given coordinate
    ///
    /// - parameters:
    ///     - at coordinate: a valid CLLocationCoordinate2D instance
    ///
    /// - returns: An optional WeatherConditions object with the current weather
    ///
    /// - throws: WeatherError
    ///
    func getWeather(
        at coordinate: CLLocationCoordinate2D
    ) async throws -> WeatherConditions?
}
