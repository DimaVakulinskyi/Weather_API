//
//  WeatherDetailsView.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 19.05.2023.
//

import SwiftUI

struct WeatherDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    let weatherData: WeatherData
    
    var body: some View {
        ScrollView {
            VStack {
                Image(weatherData.weather.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                
                Text(weatherData.weather.description)
                    .font(.custom("OpenSans-Bold", size: 24))
                    .foregroundColor(Color(hex: 0x575757))
                
                Text(weatherData.datetime)
                    .font(.custom("OpenSans-Regular", size: 20))
                    .foregroundColor(Color(hex: 0x575757))
                
                HStack {
                    Text("Max: \(Int(weatherData.appMaxTemp))°C")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("Min: \(Int(weatherData.appMinTemp))°C")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                }
                
                Spacer(minLength: 50)
                
                VStack(alignment: .leading) {
                    Text("Clouds: \(weatherData.clouds)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
        
                    Text("Moon phase: \(weatherData.moonPhase)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("Moonrise: \(weatherData.moonriseTs)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("Moonset: \(weatherData.moonsetTs)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("Ozone: \(weatherData.ozone)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("Sunrise: \(weatherData.sunriseTs)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("Sunset: \(weatherData.sunsetTs)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("UV Index: \(weatherData.uv)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                    
                    Text("Wind Direction: \(weatherData.windDirection)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))

                    Text("Wind Speed: \(weatherData.windSpeed)")
                        .font(.custom("OpenSans-Regular", size: 20))
                        .foregroundColor(Color(hex: 0x575757))
                }
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color(hex: 0x289460))
                Text("Back")
                    .foregroundColor(Color(hex: 0x289460))
                    .font(.custom("OpenSans-Regular", size: 16))
            }
        )
    }
}
