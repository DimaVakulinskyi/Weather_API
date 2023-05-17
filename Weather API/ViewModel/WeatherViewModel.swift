//
//  WeatherViewModel.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 17.05.2023.
//

import MapKit
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var weather: WeatherResponse?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func fetchData(for city: String) {
        if city.isEmpty {
            fetchWeatherDataWithCurrentLocation()
        } else {
            fetchWeatherDataWithCity(city)
        }
    }
}
