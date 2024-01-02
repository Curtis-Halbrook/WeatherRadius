//
//  AppDependencyContainer.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/23/23.
//

import Foundation

public class AppDependencyContainer {
    
    init() {
        self.networkProvider = BasicNetwork()
    }
    
    public lazy var settingsDependencyContainer: SettingsDependencyContainer = {
        SettingsDependencyContainer()
    }()
    
    private let networkProvider: NetworkProvider
}
