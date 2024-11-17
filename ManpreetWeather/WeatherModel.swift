// Name: Manpreet, ID: 991498747
//  WeatherModel.swift
//  ManpreetWeather
//
//  Created by manpreet kaur on 2024-11-14.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let current: CurrentWeather
}

struct Location: Codable {
    let name: String
    let country: String
}

struct CurrentWeather: Codable {
    let temp_c: Double
    let feelslike_c: Double
    let wind_kph: Double
    let wind_dir: String
    let humidity: Int
    let uv: Double
    let vis_km: Double
    let condition: Condition
}

struct Condition: Codable {
    let text: String
    
}

