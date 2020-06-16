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


struct WeatherInfo: Codable {
    
    fileprivate var weather: [Weather]
    var main: Main
    var wind: Wind
    var name: String
    
    var firstWeatherUnwrapped: Weather {
        if let first = weather.first {
            return first
        }
        return Weather(main: "Error", description: "Error", icon: "Error")
    }
    
    struct Weather: Codable {
        var main: String
        var description: String
        var icon: String
    }
        
    struct Main: Codable {
        fileprivate var temp: Double
        fileprivate var feelsLike: Double
        
        private let kelvin = 273.15
        var tempCString: String { String(Int(temp - kelvin)) }
        var feelsLikeCString: String { String(Int(feelsLike - kelvin)) }
        var feelsLikeCDouble: Double { feelsLike - kelvin }
        
        func kelvinToCelcius(k: Double) -> Double {
            k - 273.15
        }
    }
    
    struct Wind: Codable {
        var speed: Double
    }
    
    
}


enum MockData {
    
    static func previewData() -> WeatherInfo {
        WeatherInfo(weather: [WeatherInfo.Weather(main: "Clear", description: "clear sky", icon: "01d")], main: WeatherInfo.Main(temp: 281.52, feelsLike: 278.99), wind: WeatherInfo.Wind(speed: 0.47), name: "Shuzen")
    }
    
}
