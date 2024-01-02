//
//  SettingsRepository.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

public protocol SettingsRepository {
    
    func saveSettings(_ settings: Settings) async
    
    /// Gets the settings for the user.
    ///
    /// NOTE: If Settings has never been saved before, a Settings object with
    /// default values will be returned.
    ///
    func getSettings() async -> Settings
}
