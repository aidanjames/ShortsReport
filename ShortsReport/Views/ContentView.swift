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
    
    var shortsDescription: String {
        guard locationManager.lastKnownLocation != nil && viewModel.canWearShorts != nil else { return "?" }
        return viewModel.canWearShorts! ? "YES" : "NO"
    }
    
    var body: some View {
        VStack {
            
            Text("Is today appropriate for wearing SHORTS?")
            
            locationManager.lastKnownLocation.map { _ in
                Text(shortsDescription).font(.largeTitle).bold().padding()
                    .onAppear {
                        self.viewModel.toggleShortsWithDelay()
                        self.fetchWeather()
                }
                
            }
            
            if viewModel.canWearShorts != nil {
                if viewModel.canWearShorts! {
                    Image("shorts\(Int.random(in: 1...7))")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("pants\(Int.random(in: 1...11))")
                        .resizable()
                        .scaledToFit()
                }
                Button("Change") {
                    self.viewModel.toggleShortsWithDelay()
                }
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
