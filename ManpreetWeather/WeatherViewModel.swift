// Name: Manpreet, ID: 991498747
//  WeatherViewModel.swift
//  ManpreetWeather
//  "77f53e52b3fe4ff580d165147241411"
//  Created by manpreet kaur on 2024-11-14.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?

    private let apiKey = "77f53e52b3fe4ff580d165147241411"

    func fetchWeather() {
        // Static coordinates for Toronto
        let latitude = 43.65107
        let longitude = -79.347015
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(latitude),\(longitude)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            DispatchQueue.main.async {
                do {
                    self.weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }

}
