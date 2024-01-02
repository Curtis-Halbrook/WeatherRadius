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
        
        //weather data is so ephemeral, we don't want to store data beyond a
        //given session
        self.weatherDatastore = MainWeatherDatastore(
            coreDatastore: MemoryDatastore()
        )
    }
    
    public func makeWeatherRepository() -> WeatherRepository {
        return MainWeatherRepository(
            service: makeWeatherService(),
            datastore: weatherDatastore,
            cacheDurationProvider: cacheDurationProvider
        )
    }
    
    private func makeWeatherService() -> WeatherService {
        return OpenWeatherMapService(
            networkProvider: networkProvider,
            apiKeyProvider: apiKeyProvider,
            settingsProvider: settingsProvider
        )
    }
    
    private let weatherDatastore: WeatherDatastore
    private let apiKeyProvider: WeatherAPIKeyProvider
    private let settingsProvider: WeatherSettingsProvider
    private let networkProvider: NetworkProvider
    private let cacheDurationProvider: WeatherCacheDurationProvider
}
