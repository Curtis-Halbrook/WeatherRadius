//
//  Settings.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

public struct Settings: Codable {
    public let units: Units
    
    public static var `default`: Settings {
        get {
            switch Locale.current.measurementSystem {
            case .us:
                return Settings(units: .imperial)
                
            default:
                return Settings(units: .metric)
            }
        }
    }
    
    public enum Units: String, Codable {
        case imperial
        case metric
    }
    
    
}

