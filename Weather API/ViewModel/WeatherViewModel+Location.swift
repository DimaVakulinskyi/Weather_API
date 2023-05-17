//
//  WeatherViewModel+Location.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 18.05.2023.
//

import CoreLocation

extension WeatherViewModel {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            fetchData(for: "")
        }
    }
}
