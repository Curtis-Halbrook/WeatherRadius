//
//  MainWeatherDatastore.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation
import CoreLocation

actor MainWeatherDatastore: WeatherDatastore {
    
    init(coreDatastore: Datastore) {
        self.coreDatastore = coreDatastore
    }
    
    func getWeather(
        at coordinate: CLLocationCoordinate2D
    ) async -> WeatherConditions? {
        await coreDatastore.get(key: coordinate.asKey())
    }
    
    func saveWeather(
        _ weather: WeatherConditions,
        at coordinate: CLLocationCoordinate2D
    ) async {
        await coreDatastore.save(value: weather, key: coordinate.asKey())
    }

    private let coreDatastore: Datastore
}

private extension CLLocationCoordinate2D {
    func asKey() -> String {
        String(format: "%0.3f,%0.3f", latitude, longitude)
    }
}
