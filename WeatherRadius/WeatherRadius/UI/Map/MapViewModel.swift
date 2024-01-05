//
//  MapViewModel.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/5/24.
//

import Foundation
import CoreLocation

@Observable
class MapViewModel {
    
    var currentLocation: CLLocationCoordinate2D? = nil
    var currentWeather: WeatherConditions? = nil
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func setCurrentLocation(_ coordinate: CLLocationCoordinate2D) async {
        self.currentLocation = coordinate
        do {
            let wx = try await weatherRepository.getWeather(
                at: coordinate
            )
            self.currentWeather = wx
        } catch {
            //TODO: When an error happens, we could put a problem icon and
            //      proble the error object to get details to inform the user.
            //      This will be left to you.
        }
    }
    
    private let weatherRepository: WeatherRepository
}
