//
//  WeatherSettingsProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

/// In order to make the call for WX data, we need to know what units and what
/// language to return the data.  This Provider declares the behavior that
/// something in the app must conform to in order to properly call the weather
/// service.
public protocol WeatherSettingsProvider {
    
    func getSettings() async -> WeatherSettings
}
