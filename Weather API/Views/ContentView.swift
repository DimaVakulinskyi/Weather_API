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
            SearchBarView(text: $searchText) { searchText in
                self.searchText = searchText
            } onSearchButtonClicked: {
                viewModel.fetchData(for: searchText)
            }
            .padding(.top)
            
            Spacer()
            
            if let weather = viewModel.weather {
                Text("\(weather.cityName)")
                    .font(.custom("OpenSans-Bold", size: 24))
                    .foregroundColor(Color(hex: 0x289460))
                Text("\(weather.country)")
                    .font(.custom("OpenSans-Regular", size: 16))
                    .foregroundColor(Color(hex: 0x575757))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
