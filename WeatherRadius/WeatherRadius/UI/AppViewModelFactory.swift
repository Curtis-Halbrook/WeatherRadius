//
//  AppViewModelFactory.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/3/24.
//

import Foundation

// This class handles the creation of view models in the app, and injects the
// appropriate Repositories that are needed.  There should be a single instance
// of this that is globally accessible to the application.
//
// Lifetimes of ViewModels can be controlled here.  For example, if you want a
// unique VM per V instance, just return a new VM on each call to
// makeXxxViewModel().  If you need a shared one, make it a lazy property.
//
// Complex apps are likely to have a lot of VMs, so instead of making a monolith
// factory class with ALL VMs, break them down into smaller groups.  For example
// here you could have a MapViewModelFactory, a SettingsViewModelFactory, and
// so on, and have each of them maintained by the AppViewModelFactory.  This
// heirarchy of VM factories will then make it easier to manage them.
//
// Here, we are just putting everything into a single one, since we only have
// a view VMs to deal with.

public class AppViewModelFactory: ObservableObject {
    
    init(appDependencyContainer: AppDependencyContainer) {
        self.appDependencyContainer = appDependencyContainer
    }
    
    func makeSettingsViewModel() -> SettingsViewModel {
        return SettingsViewModel(
            settingsRepository: appDependencyContainer
                .settingsDependencyContainer
                .makeSettingsRepository()
        )
    }
    
    func makeMapViewModel() -> MapViewModel {
        return MapViewModel(
            weatherRepository: appDependencyContainer
                .weatherDependencyContainer
                .makeWeatherRepository()
        )
    }
    
    private let appDependencyContainer: AppDependencyContainer
}
