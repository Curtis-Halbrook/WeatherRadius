//
//  MainSettingsRepository.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

class MainSettingsRepository : SettingsRepository {
    
    init(datastore: SettingsDatastore) {
        self.datastore = datastore
    }
    
    func saveSettings(_ settings: Settings) async {
        await datastore.saveSettings(settings)
    }
    
    func getSettings() async -> Settings {
        return await datastore.getSettings() ?? Settings.default
    }
    
    private let datastore: SettingsDatastore
}
