//
//  WeatherConditions.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/1/24.
//

import Foundation


/// This is the object that is returned from the WeatherRepository
public struct WeatherConditions: Codable {
    
    /// The UNIX time that the response was returned
    public let dateTime: TimeInterval
    
    /// Gets the current temperature in Settings-specific units
    public let temperature: Measurement<UnitTemperature>
    
    /// Gets the current weather description, such as
    public let description: String
    
    /// Gets the correct icon to show for the current conditions
    /// The Icon is a SF icon code (ex: sun.max.fill, cloud.moon.fill)
    public let icon: String
    
    /// Gets the current Wind conditions
    public let wind: Wind
    
    /// A type that contains the wind values for the current location
    public struct Wind: Codable {
        
        /// The direction in degrees the wind is originating
        public let direction: Int
        
        /// Gets the current wind speed in Settings-specific units
        public let speed: Measurement<UnitSpeed>
    }
}
