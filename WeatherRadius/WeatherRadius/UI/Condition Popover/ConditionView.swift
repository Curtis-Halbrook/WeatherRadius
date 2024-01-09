//
//  ConditionView.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/3/24.
//

import SwiftUI

struct ConditionView: View {
    
    var conditions: WeatherConditions
    
    @State private var apparation = 0.0
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: conditions.icon)
                Text(
                    String(
                        format: "",
                        conditions.temperature.value,
                        conditions.temperature.unit.symbol
                    )
                )
            }
            Text(conditions.description)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 3)
        )
        .shadow(radius: 10, x: 10, y: 10)
        .scaleEffect(apparation)
        .opacity(apparation)
        .onAppear {
            withAnimation(.snappy) {
                apparation = 1.0
            }
        }
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
