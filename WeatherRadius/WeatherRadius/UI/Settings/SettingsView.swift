//
//  SettingsView.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/3/24.
//

import SwiftUI

struct SettingsView: View {
    @Bindable var viewModel: SettingsViewModel
    
    var body: some View {
        Form {
            Text("Units")
            Picker("Units", selection: $viewModel.units) {
                ForEach(Settings.Units.allCases, id: \.self) { unit in
                    Text(unit.rawValue.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .task {
            await viewModel.load()
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(
        viewModel: SettingsViewModel(
            settingsRepository: PreviewSettingsRepository()
        )
    )
}
