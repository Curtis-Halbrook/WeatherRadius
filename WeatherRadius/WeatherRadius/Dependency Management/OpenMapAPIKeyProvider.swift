//
//  OpenMapAPIKeyProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation

class OpenMapAPIKeyProvider: WeatherAPIKeyProvider {
    func getKey() async -> String {
        Keys.OpenWeatherMapAPI
    }
}
