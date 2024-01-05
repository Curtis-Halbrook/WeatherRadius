//
//  ShowSettingsButton.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/4/24.
//

import SwiftUI

struct ShowSettingsButton: View {
    @Binding var isActive: Bool
    
    var body: some View {
        Button {
            isActive = true
        } label: {
            Label("Settings", systemImage: "switch.2")
                .help("Change the settings, such as units of measure.")
        }
    }
}

#Preview {
    ShowSettingsButton(isActive: .constant(false))
}
