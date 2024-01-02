//
//  WeatherDependencyContainer.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

public class WeatherDependencyContainer {
    
    init(
        networkProvider: NetworkProvider,
        settingsProvider: WeatherSettingsProvider,
        apiKeyProvider: WeatherAPIKeyProvider,
        cacheDurationProvider: WeatherCacheDurationProvider
    ) {
        self.apiKeyProvider = apiKeyProvider
        self.networkProvider = networkProvider
        self.settingsProvider = settingsProvider
        self.cacheDurationProvider = cacheDurationProvider
    }
    
    private func makeWeatherService() -> WeatherService {
        return OpenWeatherMapService(
            networkProvider: networkProvider,
            apiKeyProvider: apiKeyProvider,
            settingsProvider: settingsProvider
        )
    }
    
    private let apiKeyProvider: WeatherAPIKeyProvider
    private let settingsProvider: WeatherSettingsProvider
    private let networkProvider: NetworkProvider
    private let cacheDurationProvider: WeatherCacheDurationProvider
}
