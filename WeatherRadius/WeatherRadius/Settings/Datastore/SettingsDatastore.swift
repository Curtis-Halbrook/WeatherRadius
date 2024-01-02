//
//  SettingsDatastore.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

protocol SettingsDatastore : Actor {
    
    func saveSettings(_ settings: Settings) async
    
    func getSettings() async -> Settings?
    
}
