//
//  MapView.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Bindable var viewModel: MapViewModel
    
    @State var cameraPosition: MapCameraPosition = .camera(
        MapCamera(
            centerCoordinate: CLLocationCoordinate2D(
                latitude: 33.91543,
                longitude: -84.34053),
            distance: 5000,
            heading: 90,
            pitch: 45
        )
    )
    
    var body: some View {
        MapReader { mapProxy in 
            Map(position: $cameraPosition) {
                if 
                    let location = viewModel.currentLocation,
                    let condition = viewModel.currentWeather
                {
                    Annotation("", coordinate: location, anchor: .bottom) {
                        ConditionView(
                            conditions: condition
                        )
                    }
                }
            }
            .mapControlVisibility(.hidden)
            .onTapGesture { screenCoordinate in
                if let loc = mapProxy.convert(screenCoordinate, from: .local) {
                    Task {
                        await viewModel.setCurrentLocation(loc)
                    }
                }
            }
        }
    }
}

#Preview {
    MapView(
        viewModel: MapViewModel(
            weatherRepository: PreviewWeatherRepository()
        )
    )
}

private extension MapProxy {
    
    
}
