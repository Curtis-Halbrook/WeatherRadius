//
//  Response.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/22/23.
//

import Foundation

/// This is the Response object from the OpenWeatherMap API
struct Response: Codable {
    let lat: Double
    let lon: Double
    let current: CurrentConditions
}
 
struct CurrentConditions : Codable {
    let dt: Double
    let temp: Double
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    
    struct Weather: Codable {
        let description: String
        let icon: String
    }
}
