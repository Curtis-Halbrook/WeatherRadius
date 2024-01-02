//
//  AppDependencyContainer.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

public class AppDependencyContainer {
    
    init() {
        self.networkProvider = BasicNetwork()
    }
    
    public lazy var settingsDependencyContainer: SettingsDependencyContainer = {
        SettingsDependencyContainer()
    }()
    
    public lazy var weatherDependencyContainer: WeatherDependencyContainer = {
        WeatherDependencyContainer(
            networkProvider: networkProvider,
            settingsProvider: SettingsCoordinator(
                settingsRepo: settingsDependencyContainer.makeSettingsRepository()
            ),
            apiKeyProvider: OpenMapAPIKeyProvider(),
            cacheDurationProvider: MainWXCacheDurationProvider()
       )
    }()
    
    private let networkProvider: NetworkProvider
}
