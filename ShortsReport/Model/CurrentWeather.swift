//
//  CurrentWeather.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 14/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import CoreLocation
import Foundation

/*
 https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={your api key}
 
 {"coord": { "lon": 139,"lat": 35},
 "weather": [
 {
 "id": 800,
 "main": "Clear",
 "description": "clear sky",
 "icon": "01n"
 }
 ],
 "base": "stations",
 "main": {
 "temp": 281.52,
 "feels_like": 278.99,
 "temp_min": 280.15,
 "temp_max": 283.71,
 "pressure": 1016,
 "humidity": 93
 },
 "wind": {
 "speed": 0.47,
 "deg": 107.538
 },
 "clouds": {
 "all": 2
 },
 "dt": 1560350192,
 "sys": {
 "type": 3,
 "id": 2019346,
 "message": 0.0065,
 "country": "JP",
 "sunrise": 1560281377,
 "sunset": 1560333478
 },
 "timezone": 32400,
 "id": 1851632,
 "name": "Shuzenji",
 "cod": 200
 }
 
 */

class CurrentWeather: ObservableObject {
    @Published var currentWeather: WeatherInfo?
    
    func fetchCurrentWeather(fromLocation coordinates: CLLocationCoordinate2D) {
        // formulate URL
        let URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API.key)"
        NetworkManager.shared.fetchData(from: URL) { result in
            switch result {
            case .success(let data):
                print(data)
                // Decode data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    self.currentWeather = try decoder.decode(WeatherInfo.self, from: data)
                    print(self.currentWeather!)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                fatalError("We couldn't get the data: \(error.localizedDescription)")
            }
        }
    }
}

struct WeatherInfo: Codable {
    
    var weather: [Weather]
    var main: Main
    var wind: Wind
    var name: String
    
    struct Weather: Codable {
        var main: String
        var description: String
    }
    
    struct Main: Codable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
    }
    
    struct Wind: Codable {
        var speed: Double
    }
}
