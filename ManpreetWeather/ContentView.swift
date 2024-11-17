// Name: Manpreet, ID: 991498747
//  ContentView.swift
//  ManpreetWeather
//
//  Created by manpreet kaur on 2024-11-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if let weather = weatherViewModel.weather {
                Text("Weather in \(weather.location.name), \(weather.location.country)")
                    .font(.title)
                    .bold()
                
                Text("Temperature: \(weather.current.temp_c)°C")
                Text("Feels Like: \(weather.current.feelslike_c)°C")
                Text("Wind: \(weather.current.wind_kph) kph \(weather.current.wind_dir)")
                Text("Humidity: \(weather.current.humidity)%")
                Text("UV Index: \(weather.current.uv)")
                Text("Visibility: \(weather.current.vis_km) km")
                Text("Condition: \(weather.current.condition.text)")
            } else {
                Text("Fetching Weather Data...")
            }
        }
        .padding()
        .onAppear {
            weatherViewModel.fetchWeather()
        }
    }
}

#Preview {
    ContentView()
}
