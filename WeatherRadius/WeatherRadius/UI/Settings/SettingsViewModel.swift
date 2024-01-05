//
//  SettingsViewModel.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/3/24.
//

import Foundation

@Observable
class SettingsViewModel {
    
    var units: Settings.Units = .imperial
    
    init(settingsRepository: SettingsRepository) {
        self.settingsRepository = settingsRepository
    }
    
    func load() async {
        let settings = await settingsRepository.getSettings()
        self.units = settings.units
    }
    
    func save() async {
        let settings = Settings(units: units)
        await settingsRepository.saveSettings(settings)
    }
    
    private let settingsRepository: SettingsRepository
}
