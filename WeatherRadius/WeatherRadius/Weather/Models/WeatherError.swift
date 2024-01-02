//
//  WeatherError.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/1/24.
//

import Foundation


/// Declares the types of errors that can happen when fetching the weather data
public enum WeatherError : Error {
    
    /// Returned when an unexpected error happened.  See the inner error for
    /// more details
    case generic(innerError: Error)
    
    /// The API key for the weather api is incorrect
    case unauthorized
    
    /// A problem with the network happened.  Check the inner error for more
    /// details
    case network(innerError: NetworkError)
}
