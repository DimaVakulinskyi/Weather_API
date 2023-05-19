//
//  WeatherViewModel.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 17.05.2023.
//

import MapKit
import CoreLocation
import SwiftUI

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @ObservedObject private var locationManager = LocationManager()
    @Published var weather: WeatherResponse?
    
    func startUpdatingLocationAndFetchData() {
        locationManager.startUpdatingLocation()
        fetchData(for: "")
    }
    
    func fetchData(for city: String) {
        if city.isEmpty {
            fetchWeatherDataWithCurrentLocation()
        } else {
            fetchWeatherDataWithCity(city)
        }
    }
}
