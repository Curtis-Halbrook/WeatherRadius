//
//  OpenWeatherMapService.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation
import CoreLocation


class OpenWeatherMapService : WeatherService {
    
    init(
        networkProvider: NetworkProvider,
        apiKeyProvider: WeatherAPIKeyProvider,
        settingsProvider: WeatherSettingsProvider
    ) {
        self.networkProvider = networkProvider
        self.apiKeyProvider = apiKeyProvider
        self.settingsProvider = settingsProvider
    }
    
    func getWeather(
        at coordinate: CLLocationCoordinate2D
    ) async throws -> WeatherConditions? {
        do {
            let apiKey = await apiKeyProvider.getKey()
            let settings = await settingsProvider.getSettings()
            let units = settings.units
            let language = settings.language
            let lat = String(format: "%0.3f", coordinate.latitude)
            let lon = String(format: "%0.3f", coordinate.longitude)
            let exclusion = "minutely,hourly,daily,alerts"
            
            //We need to build the URL to make the call first
            let url = URL(string: Constants.Host)! //we know this is safe since we use a constant
                .appending(path: Constants.Path)
                .appending(queryItems: [
                    URLQueryItem(name: Constants.QueryParams.Lat, value: lat),
                    URLQueryItem(name: Constants.QueryParams.Lon, value: lon),
                    URLQueryItem(name: Constants.QueryParams.Exclude, value: exclusion),
                    URLQueryItem(name: Constants.QueryParams.ApiKey, value: apiKey),
                    URLQueryItem(name: Constants.QueryParams.Units, value: units.rawValue),
                    URLQueryItem(name: Constants.QueryParams.Lang, value: language)
                ])
            
            guard let result: Response = try await networkProvider.retrieve(
                destination: url
            ) else {
                return nil
            }
                        
            return WeatherConditions(
                dateTime: result.current.dt,
                temperature: Measurement(
                    value: result.current.temp,
                    unit: units.forTemperature()
                ),
                description: result.current.weather.first?.description ?? "",
                icon: IconCodeConverter.getIcon(
                    for: result.current.weather.first?.icon ?? ""
                ),
                wind: WeatherConditions.Wind(
                    direction: result.current.windDeg,
                    speed: Measurement(
                        value: result.current.windSpeed,
                        unit: units.forWind()
                    )
                )
            )
        } catch let error as WeatherError {
            throw error
        } catch let error as NetworkError{
            //Check for a 401 and throw a bad API key error if we get it
            switch error {
            case .non200Code(let errorCode):
                if errorCode == 401 {
                    throw WeatherError.unauthorized
                } else {
                    throw WeatherError.network(innerError: error)
                }
                
            default:
                throw WeatherError.network(innerError: error)
            }
            
        } catch {
            throw WeatherError.generic(innerError: error)
        }
    }
    
    private struct Constants {
        static let Host = "api.openweathermap.org"
        static let Path = "data/3.0/onecall"
        
        struct QueryParams {
            static let Lat = "lat"
            static let Lon = "lon"
            static let Exclude = "exclude"
            static let Units = "units"
            static let Lang = "lang"
            static let ApiKey = "appid"
        }
    }
    
    private let networkProvider: NetworkProvider
    private let apiKeyProvider: WeatherAPIKeyProvider
    private let settingsProvider: WeatherSettingsProvider
}

//Handy li'l extension for dealing with Units in our Measurement types
private extension WeatherSettings.Units {
    func forTemperature() -> UnitTemperature {
        switch self {
        case .imperial: UnitTemperature.fahrenheit
        case .metric: UnitTemperature.celsius
        }
    }
    
    func forWind() -> UnitSpeed {
        switch self {
        case .imperial: UnitSpeed.milesPerHour
        case .metric: UnitSpeed.kilometersPerHour
        }
    }

}
