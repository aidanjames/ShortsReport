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
    @ObservedObject var viewModel = ViewModel()
    
    var shortsDescription: String { viewModel.canWearShorts.rawValue }
    
    var body: some View {
        VStack {
            Button("Get Weather") {
                if self.locationManager.lastKnownLocation != nil {
                    self.viewModel.fetchCurrentWeather(fromLocation: self.locationManager.lastKnownLocation!)
                    print(self.viewModel.currentWeather)
                }
            }
            .padding()
            Spacer()
            Text("Is today appropriate for wearing SHORTS?")
            
            locationManager.lastKnownLocation.map { _ in
                Text(shortsDescription).font(.largeTitle).bold().padding()
                    .onAppear {
                        self.viewModel.fetchCurrentWeather(fromLocation: self.locationManager.lastKnownLocation!)
                }
            }
            
            viewModel.shortsImage
                .resizable()
                .scaledToFit()
            
            Button("Update location") {
                self.locationManager.start()
            }
            .padding()
            Text("LAT: \(self.locationManager.lastKnownLocation?.latitude ?? 0) LONG: \(self.locationManager.lastKnownLocation?.longitude ?? 0)")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
