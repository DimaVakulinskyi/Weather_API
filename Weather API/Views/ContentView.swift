//
//  ContentView.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 17.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = WeatherViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            SearchBarView(text: $searchText) { searchText in
                self.searchText = searchText
            }
            .padding(.top)
            
            Spacer()
            
            if let weather = viewModel.weather {
                WeatherInfoView(weather: weather)
            } else {
                Spacer()
                NoResultsView()
                Spacer()
            }
            Spacer()
        }
        .onAppear {
            locationManager.startUpdatingLocation()
        }
        .onChange(of: searchText) { newValue in
            if newValue.isEmpty {
                locationManager.startUpdatingLocation()
                viewModel.fetchData(for: "")
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if newValue == searchText {
                        viewModel.fetchData(for: newValue)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
