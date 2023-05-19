//
//  WeatherModel.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 17.05.2023.
//

import Foundation
import SwiftUI

struct WeatherResponse: Codable {
    let cityName: String
    let country: String
    let data: [WeatherData]
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case country = "country_code"
        case data
    }
}

struct WeatherData: Codable {
    let appMaxTemp: Double
    let appMinTemp: Double
    let clouds: Int
    let temp: Double
    let datetime: String
    let moonPhase: Double
    let moonriseTs: Int
    let moonsetTs: Int
    let ozone: Double
    let sunriseTs: Int
    let sunsetTs: Int
    let uv: Double
    let weather: WeatherInfo
    let windDirection: String
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case appMaxTemp = "app_max_temp"
        case appMinTemp = "app_min_temp"
        case clouds
        case temp
        case datetime
        case moonPhase = "moon_phase"
        case moonriseTs = "moonrise_ts"
        case moonsetTs = "moonset_ts"
        case ozone
        case sunriseTs = "sunrise_ts"
        case sunsetTs = "sunset_ts"
        case uv
        case weather
        case windDirection = "wind_cdir"
        case windSpeed = "wind_spd"
    }
}

struct WeatherInfo: Codable {
    let description: String
    let code: Int
    let icon: String
}
