//
//  ContentView.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/21/23.
//

import SwiftUI

//The ONE AND ONLY instance of the AppDependencyContainer
let appDependencyContainer = AppDependencyContainer()

struct ContentView: View {
    @StateObject var viewModelFactory = AppViewModelFactory(
        appDependencyContainer: appDependencyContainer
    )
    
    @State private var showSettingsView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                MapView(viewModel: viewModelFactory.makeMapViewModel())
            }
            .environmentObject(viewModelFactory)
            .toolbar {
                ShowSettingsButton(isActive: $showSettingsView)
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView(
                    viewModel: viewModelFactory.makeSettingsViewModel()
                )
            }
        }
        
    }
}

#Preview {
    ContentView(
    )
}
