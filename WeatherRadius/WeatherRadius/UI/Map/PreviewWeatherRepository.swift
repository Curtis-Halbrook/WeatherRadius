//
//  PreviewWeatherRepository.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/5/24.
//

import Foundation
import CoreLocation

class PreviewWeatherRepository: WeatherRepository {
    func getWeather(
        at coordinate: CLLocationCoordinate2D
    ) async throws -> WeatherConditions? {
        return WeatherConditions(
            dateTime: 1,
            temperature: Measurement(value: 72.0, unit: .fahrenheit),
            description: "partly cloudy",
            icon: "cloud.sun.fill",
            wind: WeatherConditions.Wind(
                direction: 90,
                speed: Measurement(value: 10.0, unit: .milesPerHour)
            )
        )
    }
}
