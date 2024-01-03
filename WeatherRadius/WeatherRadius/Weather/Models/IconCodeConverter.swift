//
//  IconCodeConverter.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation

// I wanted to isolate the OpenWeatherMap's icon codes in side the Weather
// subcomponent.   This is because if we switch to a different weather provider,
// such as the apple weather API, we would be changing app level code for
// something that should be subcomponent level.  Instead of returning the domain
// specific codes to the app in the WeatherConditions object, I will instead
// return these SF symbol names.

class IconCodeConverter {
    
    class func getIcon(for code: String) -> String {
        switch code {
        case "01d": "sun.max.fill"
        case "01n": "moon.stars.fill"
        case "02d": "cloud.sun.fill"
        case "02n": "cloud.moon.fill"
        case "03d": "cloud.fill"
        case "03n": "cloud.fill"
        case "04d": "smoke.fill"
        case "04n": "smoke.fill"
        case "09d": "cloud.rain.fill"
        case "09n": "cloud.rain.fill"
        case "10d": "cloud.sun.rain.fill"
        case "10n": "cloud.moon.rain.fill"
        case "11d": "cloud.bolt.fill"
        case "11n": "cloud.bolt.fill"
        case "13d": "cloud.snow.fill"
        case "13n": "cloud.snow.fill"
        case "50d": "cloud.fog.fill"
        case "50n": "cloud.fog.fill"
        
        default: "questionmark.circle.fill"
        }
    }
}
