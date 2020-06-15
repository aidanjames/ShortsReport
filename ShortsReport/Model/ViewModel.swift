//
//  ViewModel.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 11/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var currentWeather: WeatherInfo?
    
    @Published var canWearShorts: ShortsReport = .analysing {
        didSet {
            guard canWearShorts != .analysing else {
                shortsImage = Image("question")
                return
            }
            
            if canWearShorts == .onlyShortsProfessionals || canWearShorts == .maybe || canWearShorts == .definitely {
                shortsImage = Image("shorts\(Int.random(in: 1...6))")
            } else {
                shortsImage = Image("pants\(Int.random(in: 1...11))")
            }
        }
    }
        
    @Published var shortsImage: Image = Image("question")
    
    
    // Get the current weather conditions once we have a location
    func fetchCurrentWeather(fromLocation coordinates: CLLocationCoordinate2D) {
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
                    self.complicatedAlgorithym()
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                fatalError("We couldn't get the data: \(error.localizedDescription)")
            }
        }
    }
    
    
    func complicatedAlgorithym() {
        guard currentWeather != nil else { return }
        let feelsLike = currentWeather!.main.feelsLikeC
        switch feelsLike {
        case ...5 :
            canWearShorts = .absolutelyNot
        case 5...10:
            canWearShorts = .onlyShortsProfessionals
        case 10...15:
            canWearShorts = .maybe
        case 10...:
            canWearShorts = .definitely
        default:
            canWearShorts = .analysing
        }
        
    }

    
    
}

enum ShortsReport: String {
    case analysing = "Analysing complicated data"
    case definitely = "Definitely!"
    case maybe = "Yes-ish"
    case onlyShortsProfessionals = "Only for shorts professionals"
    case absolutelyNot = "No fucking way"
}
