//
//  ContentView.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 09/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            WeatherCardView(currentWeather: viewModel.weather, locationName: viewModel.lastKnownTown)
                .padding()
                .padding(.top, 50)
            Text("Can I wear shorts right now?").padding()
            Text("\(viewModel.canWearShorts.rawValue)").font(.largeTitle).bold().padding()
            viewModel.shortsImage
                .resizable()
                .scaledToFit()
            Spacer()
            Button("Get Weather") { self.viewModel.updateWeather() }
                .padding()
        }
        .onAppear() {
            self.updateLocationAndWeather()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.updateLocationAndWeather()
        }
    }
    
    func updateLocationAndWeather() {
        viewModel.updateWeather()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
