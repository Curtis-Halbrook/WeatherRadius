//
//  MainSettingsDatastore.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

actor MainSettingsDatastore : SettingsDatastore {
    
    init(coreDatastore: Datastore) {
        self.coreDatastore = coreDatastore
    }
    
    func saveSettings(_ settings: Settings) async {
        await coreDatastore.save(value: settings, key: Constants.Key)
    }
    
    func getSettings() async -> Settings? {
        return await coreDatastore.get(key: Constants.Key)
    }

    private struct Constants {
        static let Key = "Settings"
    }
    
    private let coreDatastore: Datastore
}
