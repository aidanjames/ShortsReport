//
//  ContentView.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 09/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear(perform: fetchWeather)
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
