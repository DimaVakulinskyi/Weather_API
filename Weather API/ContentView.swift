//
//  ContentView.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 17.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText) { searchText in
                self.searchText = searchText
            } onSearchButtonClicked: {
                viewModel.fetchData(for: searchText)
            }
            .padding(.top)
            
            Spacer()
            
            if let weather = viewModel.weather {
                Text("\(weather.cityName)")
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(weather.country)")
                
                List(weather.data, id: \.datetime) { weatherData in
                    WeatherCellView(weatherData: weatherData)
                }
                .listStyle(.plain)
            } else {
                Spacer()
                NoResultsView()
                Spacer()
            }
            Spacer()
        }
    }
}

struct WeatherCellView: View {
    let weatherData: WeatherData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(weatherData.datetime)")
                Text("\(weatherData.weather.description)")
            }
            Spacer()
            Image(weatherData.weather.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 8) {
                Text("Max: \(Int(weatherData.appMaxTemp))°C")
                Text("Min: \(Int(weatherData.appMinTemp))°C")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
