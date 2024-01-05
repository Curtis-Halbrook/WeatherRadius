//
//  ConditionView.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/3/24.
//

import SwiftUI

struct ConditionView: View {
    var conditions: WeatherConditions
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: conditions.icon)
                Text(conditions.temperature.formatted())
            }
            Text(conditions.description)
        }
        .background(Color.white)
    }
}

#Preview {
    ConditionView(
        conditions: WeatherConditions(
            dateTime: 0,
            temperature: Measurement(
                value: 72,
                unit: .fahrenheit
            ),
            description: "partly cloudy",
            icon: "cloud.sun.fill",
            wind: WeatherConditions.Wind(
                direction: 270,
                speed: Measurement(
                    value: 10,
                    unit: .milesPerHour
                )
            )
        )
    )
}
