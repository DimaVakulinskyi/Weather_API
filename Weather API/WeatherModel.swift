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
    let temp: Double
    let datetime: String
    let weather: WeatherInfo
    
    enum CodingKeys: String, CodingKey {
        case appMaxTemp = "app_max_temp"
        case appMinTemp = "app_min_temp"
        case temp
        case datetime
        case weather
    }
}

struct WeatherInfo: Codable {
    let description: String
    let code: Int
    let icon: String
}


