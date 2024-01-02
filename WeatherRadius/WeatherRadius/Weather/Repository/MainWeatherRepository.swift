//
//  MainWeatherRepository.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation
import CoreLocation

class MainWeatherRepository: WeatherRepository {
        
    init(
        service: WeatherService,
        datastore: WeatherDatastore,
        cacheDurationProvider: WeatherCacheDurationProvider
    ) {
        self.service = service
        self.datastore = datastore
        self.cacheDurationProvider = cacheDurationProvider
    }
    
    func getWeather(
        at coordinate: CLLocationCoordinate2D
    ) async throws -> WeatherConditions? {
        //first, check the datastore...
        if let stored = await datastore.getWeather(at: coordinate) {
            //...and If we have it, check the date it was returned versus now...
            let now = Date.now.timeIntervalSince1970
            let returned = stored.dateTime
            let duration = cacheDurationProvider.getCacheDuration()
            let maxAge = returned + duration
            if maxAge > now {
                //...and it is still fresh.  Return that, and we save an
                //   API call.
                return stored
            }
        }
        
        //... datastore is reporting empty, or data is stale.
        //Make api call instead...
        if let called = try await service.getWeather(at: coordinate) {
            //... save it for next time ...
            await datastore.saveWeather(called, at: coordinate)
            
            // ... and we're done!
            return called
        }
        
        //... but the server returned nil, so we're done with nothing to return.
        return nil
    }

    
    private let service: WeatherService
    private let datastore: WeatherDatastore
    private let cacheDurationProvider: WeatherCacheDurationProvider
}
