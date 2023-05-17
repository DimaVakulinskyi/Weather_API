//
//  WeatherViewModel+Data.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 18.05.2023.
//

import Foundation
import CoreLocation

extension WeatherViewModel {
    func fetchWeatherDataWithCurrentLocation() {
        let locationManager = CLLocationManager()
        
        guard let location = locationManager.location else { return }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        fetchWeatherData(latitude: latitude, longitude: longitude)
    }
    
    func fetchWeatherDataWithCity(_ city: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city) { [weak self] (placemarks, error) in
            guard let placemark = placemarks?.first,
                  let location = placemark.location else { return }
            
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            self?.fetchWeatherData(latitude: latitude, longitude: longitude)
        }
    }
    
    private func fetchWeatherData(latitude: Double, longitude: Double) {
        guard let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?lat=\(latitude)&lon=\(longitude)&days=16&lang=en&key=a5274a7062584412bcaf784728decd4c") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                
                let filteredData = weatherResponse.data.map { weatherData in
                    WeatherData(appMaxTemp: weatherData.appMaxTemp, appMinTemp: weatherData.appMinTemp, temp: weatherData.temp, datetime: weatherData.datetime, weather: weatherData.weather)
                }
                let cityOnlyResponse = WeatherResponse(cityName: weatherResponse.cityName,
                                                       country: weatherResponse.country,
                                                       data: filteredData)
                
                DispatchQueue.main.async {
                    self?.weather = cityOnlyResponse
                }
                
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }.resume()
    }
}
