//
//  OpenMapAPIKeyProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation

//You will need to create a file named "Keys.swift" with this format
//
// struct Keys {
//     static let OpenWeatherMapAPI = "[Your API Key]"
// }
//'cause I'm not giving you access to MINE.  :P 


class OpenMapAPIKeyProvider: WeatherAPIKeyProvider {
    func getKey() async -> String {
        Keys.OpenWeatherMapAPI
    }
}
