//
//  WeatherSettings.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

public struct WeatherSettings {
    
    public let units: Units
    
    public let language: String
    
    public enum Units: String {
        case imperial
        case metric        
    }
}
