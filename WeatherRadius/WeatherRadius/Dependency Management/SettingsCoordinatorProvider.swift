//
//  SettingsCoordinatorProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation

// Why have two different types of units, one called "Settings.Units" and 
// another in WeatherSettings.Units?  This is overkill in this case, certainly,
// but it is to demonstrate a specific need of isolating the contents of one
// subcomponent, the Settings, from another, the Weather.  Let's imagine if we
// just extracted out the Units to a common type, and shared that type between
// the two components.  That is completely appropriate in the case here where we
// are sharing a single codebase.  However, if we broke up the Settings and
// Weather subcomponents into separate frameworks, we would have a rather nasty
// interdependency we would need to resolve.  We would need to create a
// "Common" framework to share this type.  By keeping the types separate, and
// having the values injected via Providers the types declare, they can be
// isolated, and values shared between them by the app, which by definition will
// have references to both.
//
// As you build your own subcomponents, be aware of how these interdependency
// problems can occur, and strategies to avoid them.  It will be up to you, as
// the application architect, to decide when the overhead of redundant types
// can solve problems before they happen, or cause too much headache to be
// useful.

class SettingsCoordinator: WeatherSettingsProvider {
    
    init(
        settingsRepo: SettingsRepository
    ) {
        self.locale = Locale.autoupdatingCurrent
        self.settingsRepo = settingsRepo
    }
    
    func getSettings() async -> WeatherSettings {
        let appSettings = await settingsRepo.getSettings()
        
        return WeatherSettings(
            units: WeatherSettings.Units(otherUnits: appSettings.units),
            language: locale.language.languageCode?.identifier ?? "en" //I'm biased... :P
        )
    }
    
    private let locale: Locale
    private let settingsRepo: SettingsRepository
}

private extension WeatherSettings.Units {
    init(otherUnits: Settings.Units) {
        switch otherUnits {
        case .imperial:
            self = .imperial
        case .metric:
            self = .metric
        }
    }
}
