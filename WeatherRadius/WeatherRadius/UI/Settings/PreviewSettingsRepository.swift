//
//  PreviewSettingsRepository.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/3/24.
//

import Foundation


class PreviewSettingsRepository: SettingsRepository {
    
    func saveSettings(_ settings: Settings) async {
        units = settings.units
    }
    
    func getSettings() async -> Settings {
        return Settings(units: units)
    }
    
    private var units: Settings.Units = .imperial
}
