//
//  SettingsDependencyContainer.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation


public class SettingsDependencyContainer {
    
    init() {
        self.settingsDatastore = MainSettingsDatastore(
            coreDatastore: FileDatastore()
        )
    }
    
    public func makeSettingsRepository() -> SettingsRepository {
        return MainSettingsRepository(datastore: settingsDatastore)
    }
    
    private let settingsDatastore: SettingsDatastore
}
