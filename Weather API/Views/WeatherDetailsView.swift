//
//  WeatherDetailsView.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 19.05.2023.
//

import SwiftUI

struct WeatherDetailsView: View {
    let weatherData: WeatherData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(weatherData.datetime)")
                    .font(.custom("OpenSans-Bold", size: 16))
                    .foregroundColor(Color(hex: 0x575757))
                Text("\(weatherData.weather.description)")
                    .font(.custom("OpenSans-Regular", size: 16))
                    .foregroundColor(Color(hex: 0x575757))
            }
            Spacer()
            Image(weatherData.weather.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 8) {
                Text("Max: \(Int(weatherData.appMaxTemp))°C")
                    .font(.custom("OpenSans-Regular", size: 16))
                    .foregroundColor(Color(hex: 0x575757))
                Text("Min: \(Int(weatherData.appMinTemp))°C")
                    .font(.custom("OpenSans-Regular", size: 16))
                    .foregroundColor(Color(hex: 0x575757))
            }
        }
        .padding()
    }
}
