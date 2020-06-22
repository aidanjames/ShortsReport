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
        NavigationView {
            VStack {
                if viewModel.showingLoadingAnimation {
                    LottieView(filename: "loading")
                } else {
                    
                    WeatherCardView(currentWeather: viewModel.weather, locationName: viewModel.lastKnownTown)
                        .padding()
                    viewModel.shortsImage
                        .resizable()
                        .scaledToFit()
                    HStack(spacing: 0) {
                        Text("Shorts status: ")
                        Text("\(viewModel.canWearShorts.rawValue)").bold()
                    }

                }
                
                Spacer()
                Button("Get Weather") { self.viewModel.updateWeather() }
                    .padding()
            }
            .navigationBarTitle("Shorts report")
            .onAppear() {
                self.viewModel.updateWeather()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                // Only check the latest weather if the app has was backgrounded longer than 10 mins ago
                if let date = UserDefaults.standard.object(forKey: DefaultsKeys.date) as? Date {
                    guard date.minutesBetweenDates() > 10 else { return }
                    self.viewModel.updateWeather()
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
                // Save time the app goes into background so we can use this to decide if we need to update weather on returning to foreground
                UserDefaults.standard.set(Date(), forKey: DefaultsKeys.date)
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
