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

            WeatherCardView(currentWeather: viewModel.weather)
                .padding()
                .padding(.top, 50)

            Text("Can I wear shorts right now?").padding()
            
            locationManager.lastKnownLocation.map { _ in
                Text(shortsDescription).font(.largeTitle).bold().padding()
                    .onAppear {
                        self.viewModel.fetchCurrentWeather(fromLocation: self.locationManager.lastKnownLocation!)
                }
            }
            
            viewModel.shortsImage
                .resizable()
                .scaledToFit()
            
            Spacer()
            
//            Button("Update location") {
//                self.locationManager.start()
//            }
//            .padding()
//
            
            HStack {
                Image("shortFill")
                Image("shortFill")
                Image("shortFill")
                Image("shortFill")
                Image("shortBlank")
            }
            
            Button("Get Weather") {
                if self.locationManager.lastKnownLocation != nil {
                    self.viewModel.fetchCurrentWeather(fromLocation: self.locationManager.lastKnownLocation!)
                }
            }
            .padding()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
