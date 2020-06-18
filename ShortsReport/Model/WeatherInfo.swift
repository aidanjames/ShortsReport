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


struct LocationName: Codable {
    
//    fileprivate var weather: [Weather]
//    var main: Main
//    var wind: Wind
    var name: String
    
//    var firstWeatherUnwrapped: Weather {
//        if let first = weather.first {
//            return first
//        }
//        return Weather(main: "Error", description: "Error", icon: "Error")
//    }
//
//    struct Weather: Codable {
//        var main: String
//        var description: String
//        var icon: String
//    }
//
//    struct Main: Codable {
//        fileprivate var temp: Double
//        fileprivate var feelsLike: Double
//
//        private let kelvin = 273.15
//        var tempCString: String { String(Int(temp - kelvin)) }
//        var feelsLikeCString: String { String(Int(feelsLike - kelvin)) }
//        var feelsLikeCDouble: Double { feelsLike - kelvin }
//
//        func kelvinToCelcius(k: Double) -> Double {
//            k - 273.15
//        }
//    }
//
//    struct Wind: Codable {
//        var speed: Double
//    }
    
    
}


/*
 https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&exclude=hourly,daily&appid={YOUR API KEY}
 
 {"lat":33.44,"lon":-94.04,"timezone":"America/Chicago","timezone_offset":-18000,"current":{"dt":1592422959,"sunrise":1592391976,"sunset":1592443691,"temp":303.96,"feels_like":304.1,"pressure":1018,"humidity":43,"dew_point":289.94,"uvi":10.25,"clouds":1,"visibility":16093,"wind_speed":3.06,"wind_deg":129,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},"hourly":[{"dt":1592420400,"temp":303.96,"feels_like":304.1,"pressure":1018,"humidity":43,"dew_point":289.94,"clouds":1,"wind_speed":3.06,"wind_deg":129,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1592424000,"temp":303.7,"feels_like":304.49,"pressure":1018,"humidity":48,"dew_point":291.45,"clouds":14,"wind_speed":3.03,"wind_deg":123,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]},{"dt":1592427600,"temp":303.4,"feels_like":304.68,"pressure":1017,"humidity":52,"dew_point":292.45,"clouds":19,"wind_speed":2.98,"wind_deg":120,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]},{"dt":1592431200,"temp":302.86,"feels_like":304.63,"pressure":1015,"humidity":57,"dew_point":293.43,"clouds":26,"wind_speed":2.94,"wind_deg":120,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},{"dt":1592434800,"temp":301.99,"feels_like":304.53,"pressure":1015,"humidity":63,"dew_point":294.24,"clouds":43,"wind_speed":2.4,"wind_deg":126,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"rain":{"1h":0.25}},{"dt":1592438400,"temp":299.87,"feels_like":302.96,"pressure":1015,"humidity":74,"dew_point":294.97,"clouds":52,"wind_speed":2.07,"wind_deg":146,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"rain":{"1h":0.42}},{"dt":1592442000,"temp":297.42,"feels_like":299.89,"pressure":1015,"humidity":80,"dew_point":293.84,"clouds":100,"wind_speed":2.16,"wind_deg":151,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"rain":{"1h":0.15}},{"dt":1592445600,"temp":296.07,"feels_like":298.06,"pressure":1016,"humidity":80,"dew_point":292.56,"clouds":100,"wind_speed":1.96,"wind_deg":137,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}]},{"dt":1592449200,"temp":295.54,"feels_like":297.41,"pressure":1016,"humidity":80,"dew_point":291.95,"clouds":94,"wind_speed":1.79,"wind_deg":136,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}]},{"dt":1592452800,"temp":294.94,"feels_like":296.14,"pressure":1016,"humidity":79,"dew_point":291.34,"clouds":80,"wind_speed":2.27,"wind_deg":129,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}]},{"dt":1592456400,"temp":294.21,"feels_like":295.1,"pressure":1016,"humidity":80,"dew_point":290.67,"clouds":64,"wind_speed":2.41,"wind_deg":133,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}]},{"dt":1592460000,"temp":293.77,"feels_like":294.45,"pressure":1016,"humidity":80,"dew_point":290.39,"clouds":53,"wind_speed":2.45,"wind_deg":146,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}]},{"dt":1592463600,"temp":293.37,"feels_like":293.81,"pressure":1016,"humidity":82,"dew_point":290.27,"clouds":0,"wind_speed":2.8,"wind_deg":145,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]},{"dt":1592467200,"temp":293.03,"feels_like":293.59,"pressure":1016,"humidity":83,"dew_point":290.17,"clouds":0,"wind_speed":2.54,"wind_deg":158,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]},{"dt":1592470800,"temp":292.74,"feels_like":293.4,"pressure":1016,"humidity":84,"dew_point":290.09,"clouds":0,"wind_speed":2.35,"wind_deg":165,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]},{"dt":1592474400,"temp":292.62,"feels_like":293.13,"pressure":1015,"humidity":84,"dew_point":289.95,"clouds":0,"wind_speed":2.5,"wind_deg":164,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]},{"dt":1592478000,"temp":292.6,"feels_like":293.13,"pressure":1015,"humidity":84,"dew_point":289.93,"clouds":7,"wind_speed":2.45,"wind_deg":159,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]},{"dt":1592481600,"temp":293.01,"feels_like":293.87,"pressure":1015,"humidity":86,"dew_point":290.63,"clouds":6,"wind_speed":2.43,"wind_deg":155,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1592485200,"temp":295.23,"feels_like":296.06,"pressure":1016,"humidity":80,"dew_point":291.69,"clouds":0,"wind_speed":3.09,"wind_deg":149,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1592488800,"temp":297.34,"feels_like":298.27,"pressure":1016,"humidity":73,"dew_point":292.39,"clouds":6,"wind_speed":3.32,"wind_deg":166,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1592492400,"temp":299.41,"feels_like":300.59,"pressure":1016,"humidity":67,"dew_point":292.86,"clouds":4,"wind_speed":3.35,"wind_deg":173,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1592496000,"temp":301.23,"feels_like":302.6,"pressure":1016,"humidity":61,"dew_point":293.23,"clouds":3,"wind_speed":3.21,"wind_deg":169,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1592499600,"temp":302.46,"feels_like":304.09,"pressure":1016,"humidity":57,"dew_point":293.2,"clouds":2,"wind_speed":2.88,"wind_deg":170,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]},{"dt":1592503200,"temp":302.72,"feels_like":304.86,"pressure":1016,"humidity":58,"dew_point":293.74,"clouds":2,"wind_speed":2.51,"wind_deg":177,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"rain":{"1h":1.2}},{"dt":1592506800,"temp":302.95,"feels_like":305.6,"pressure":1015,"humidity":57,"dew_point":293.59,"clouds":16,"wind_speed":1.74,"wind_deg":162,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"rain":{"1h":1.39}},{"dt":1592510400,"temp":303.57,"feels_like":305.76,"pressure":1015,"humidity":52,"dew_point":292.9,"clouds":23,"wind_speed":1.77,"wind_deg":143,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"rain":{"1h":0.19}},{"dt":1592514000,"temp":303.46,"feels_like":305.49,"pressure":1014,"humidity":55,"dew_point":293.61,"clouds":34,"wind_speed":2.55,"wind_deg":151,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},{"dt":1592517600,"temp":303.34,"feels_like":305.14,"pressure":1013,"humidity":57,"dew_point":294.01,"clouds":38,"wind_speed":3.2,"wind_deg":163,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},{"dt":1592521200,"temp":303.24,"feels_like":305.19,"pressure":1013,"humidity":59,"dew_point":294.38,"clouds":34,"wind_speed":3.32,"wind_deg":160,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},{"dt":1592524800,"temp":301.8,"feels_like":304.06,"pressure":1013,"humidity":65,"dew_point":294.73,"clouds":29,"wind_speed":3.04,"wind_deg":148,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},{"dt":1592528400,"temp":299.42,"feels_like":301.42,"pressure":1013,"humidity":71,"dew_point":293.84,"clouds":17,"wind_speed":2.82,"wind_deg":150,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]},{"dt":1592532000,"temp":298.05,"feels_like":299.43,"pressure":1014,"humidity":70,"dew_point":292.26,"clouds":14,"wind_speed":2.67,"wind_deg":159,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]},{"dt":1592535600,"temp":297.4,"feels_like":298.6,"pressure":1014,"humidity":69,"dew_point":291.57,"clouds":12,"wind_speed":2.39,"wind_deg":159,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]},{"dt":1592539200,"temp":296.58,"feels_like":297.52,"pressure":1014,"humidity":72,"dew_point":291.42,"clouds":9,"wind_speed":2.7,"wind_deg":142,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]},{"dt":1592542800,"temp":295.86,"feels_like":296.57,"pressure":1014,"humidity":75,"dew_point":291.27,"clouds":9,"wind_speed":3.01,"wind_deg":138,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]},{"dt":1592546400,"temp":295.35,"feels_like":295.83,"pressure":1015,"humidity":76,"dew_point":290.99,"clouds":12,"wind_speed":3.16,"wind_deg":148,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]},{"dt":1592550000,"temp":294.87,"feels_like":295.22,"pressure":1015,"humidity":76,"dew_point":290.62,"clouds":56,"wind_speed":3.07,"wind_deg":163,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}]},{"dt":1592553600,"temp":294.47,"feels_like":294.79,"pressure":1016,"humidity":76,"dew_point":290.23,"clouds":33,"wind_speed":2.89,"wind_deg":157,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}]},{"dt":1592557200,"temp":293.98,"feels_like":294.26,"pressure":1016,"humidity":77,"dew_point":289.97,"clouds":22,"wind_speed":2.79,"wind_deg":166,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]},{"dt":1592560800,"temp":293.65,"feels_like":294.06,"pressure":1016,"humidity":78,"dew_point":289.86,"clouds":16,"wind_speed":2.55,"wind_deg":174,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]},{"dt":1592564400,"temp":293.34,"feels_like":294.14,"pressure":1016,"humidity":81,"dew_point":290.15,"clouds":14,"wind_speed":2.15,"wind_deg":182,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]},{"dt":1592568000,"temp":293.93,"feels_like":295.42,"pressure":1016,"humidity":85,"dew_point":291.34,"clouds":19,"wind_speed":1.96,"wind_deg":196,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}]},{"dt":1592571600,"temp":296.19,"feels_like":297.86,"pressure":1017,"humidity":78,"dew_point":292.3,"clouds":28,"wind_speed":2.23,"wind_deg":203,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},{"dt":1592575200,"temp":298.3,"feels_like":300.07,"pressure":1017,"humidity":70,"dew_point":292.63,"clouds":35,"wind_speed":2.28,"wind_deg":200,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},{"dt":1592578800,"temp":300.24,"feels_like":301.84,"pressure":1018,"humidity":61,"dew_point":292.26,"clouds":53,"wind_speed":2.27,"wind_deg":201,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}]},{"dt":1592582400,"temp":301.94,"feels_like":303.19,"pressure":1017,"humidity":54,"dew_point":291.85,"clouds":64,"wind_speed":2.54,"wind_deg":199,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}]},{"dt":1592586000,"temp":303.31,"feels_like":304.45,"pressure":1017,"humidity":51,"dew_point":292.11,"clouds":65,"wind_speed":2.92,"wind_deg":198,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}]},{"dt":1592589600,"temp":304.36,"feels_like":305.42,"pressure":1017,"humidity":48,"dew_point":292.23,"clouds":67,"wind_speed":3.02,"wind_deg":199,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}]}],"daily":[{"dt":1592416800,"sunrise":1592391976,"sunset":1592443691,"temp":{"day":303.96,"min":293.85,"max":303.96,"night":293.85,"eve":300.75,"morn":303.96},"feels_like":{"day":304.04,"night":294.56,"eve":303.56,"morn":304.04},"pressure":1018,"humidity":43,"dew_point":289.94,"wind_speed":3.15,"wind_deg":134,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":1,"rain":0.86,"uvi":10.25},{"dt":1592503200,"sunrise":1592478384,"sunset":1592530107,"temp":{"day":302.72,"min":293.01,"max":303.46,"night":295.35,"eve":301.8,"morn":293.01},"feels_like":{"day":304.86,"night":295.83,"eve":304.06,"morn":293.87},"pressure":1016,"humidity":58,"dew_point":293.74,"wind_speed":2.51,"wind_deg":177,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":2,"rain":2.83,"uvi":10.34},{"dt":1592589600,"sunrise":1592564794,"sunset":1592616522,"temp":{"day":304.36,"min":293.93,"max":304.94,"night":295.09,"eve":302.47,"morn":293.93},"feels_like":{"day":305.42,"night":295.34,"eve":304.63,"morn":295.42},"pressure":1017,"humidity":48,"dew_point":292.23,"wind_speed":3.02,"wind_deg":199,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"clouds":67,"uvi":10.25},{"dt":1592676000,"sunrise":1592651205,"sunset":1592702935,"temp":{"day":303.95,"min":294.88,"max":304.52,"night":295.56,"eve":302.17,"morn":294.88},"feels_like":{"day":305.3,"night":295.95,"eve":304.55,"morn":296},"pressure":1016,"humidity":48,"dew_point":291.82,"wind_speed":2.38,"wind_deg":216,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"clouds":83,"uvi":10.5},{"dt":1592762400,"sunrise":1592737617,"sunset":1592789348,"temp":{"day":304.29,"min":295.05,"max":305.24,"night":296.6,"eve":302.51,"morn":295.05},"feels_like":{"day":305.48,"night":297.48,"eve":305.27,"morn":296.29},"pressure":1014,"humidity":52,"dew_point":293.47,"wind_speed":3.65,"wind_deg":175,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":97,"uvi":10.66},{"dt":1592848800,"sunrise":1592824031,"sunset":1592875758,"temp":{"day":304.45,"min":295.56,"max":306.66,"night":298.53,"eve":304.17,"morn":295.56},"feels_like":{"day":306.42,"night":299.69,"eve":306.26,"morn":297.85},"pressure":1013,"humidity":58,"dew_point":295.34,"wind_speed":3.93,"wind_deg":210,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":89,"uvi":9.93},{"dt":1592935200,"sunrise":1592910445,"sunset":1592962168,"temp":{"day":303.83,"min":295.62,"max":306.05,"night":298.63,"eve":302.24,"morn":295.62},"feels_like":{"day":304.88,"night":300.59,"eve":304.9,"morn":297.75},"pressure":1012,"humidity":59,"dew_point":295.03,"wind_speed":5.02,"wind_deg":242,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":64,"rain":0.74,"uvi":11.56},{"dt":1593021600,"sunrise":1592996862,"sunset":1593048575,"temp":{"day":300.77,"min":295.82,"max":302.18,"night":295.82,"eve":300.79,"morn":296.31},"feels_like":{"day":303.27,"night":298.74,"eve":304.64,"morn":298.51},"pressure":1012,"humidity":79,"dew_point":296.81,"wind_speed":4.44,"wind_deg":277,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"clouds":53,"rain":10.85,"uvi":11.28}]}
  */

struct OneCallWeather: Codable {
    
    var current: WeatherSituation
    var hourly: [WeatherSituation]
    var daily: [DailyWeatherSituation]
    
    struct WeatherSituation: Codable {
        var dt: Double
        var temp: Double
        var feelsLike: Double
        var humidity: Int
        var windSpeed: Double
        var windDeg: Int
        fileprivate var weather: [Weather]
        
        var firstWeatherUnwrapped: Weather {
            if let first = weather.first {
                return first
            }
            return Weather(main: "Error", description: "Error", icon: "Error")
        }
        
        
    }
    
    struct DailyWeatherSituation: Codable {
        var dt: Double
        var temp: Temperature
        var feelsLike: FeelsLikeTemp
        var humidity: Double
        var windSpeed: Double
        var windDeg: Double
        fileprivate var weather: [Weather]
        
        var firstWeatherUnwrapped: Weather {
            if let first = weather.first {
                return first
            }
            return Weather(main: "Error", description: "Error", icon: "Error")
        }
        
        struct Temperature: Codable {
            var min: Double
            var max: Double
            
        }
        
        struct FeelsLikeTemp: Codable {
            var day: Double
            var night: Double
            var eve: Double
            var morn: Double
        }
    }
    
    struct Weather: Codable {
        var main: String
        var description: String
        var icon: String
    }
    
    
}









//enum MockData {
//
//    static func previewData() -> WeatherInfo {
//        WeatherInfo(weather: [WeatherInfo.Weather(main: "Clear", description: "clear sky", icon: "01d")], main: WeatherInfo.Main(temp: 281.52, feelsLike: 278.99), wind: WeatherInfo.Wind(speed: 0.47), name: "Shuzen")
//    }
//
//}
