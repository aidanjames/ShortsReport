//
//  ContentView.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 09/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Text("You are at: (\(locationManager.lastKnownLocation?.latitude ?? 0), \(locationManager.lastKnownLocation?.longitude ?? 0))")
            Text("Hello, World!")
                .onAppear {
                    self.fetchWeather()
                }
        }
    }


    
    
    func fetchWeather() {
        NetworkManager.shared.fetchData(from: API.url) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
