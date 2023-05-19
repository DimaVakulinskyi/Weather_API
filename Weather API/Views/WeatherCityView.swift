//
//  WeatherCityView.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 18.05.2023.
//

import SwiftUI

struct WeatherInfoView: View {
    let weather: WeatherResponse
    
    var body: some View {
        VStack {
            Text("\(weather.cityName)")
                .font(.custom("OpenSans-Bold", size: 24))
                .foregroundColor(Color(hex: 0x289460))
            Text("\(weather.country)")
                .font(.custom("OpenSans-Regular", size: 16))
                .foregroundColor(Color(hex: 0x575757))
            List(weather.data, id: \.datetime) { weatherData in
                NavigationLink(destination: WeatherDetailsView(weatherData: weatherData)) {
                    WeatherCellView(weatherData: weatherData)
                }
            }
            .listStyle(.plain)
        }
    }
}
