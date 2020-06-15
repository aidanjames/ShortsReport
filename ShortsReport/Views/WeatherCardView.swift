//
//  WeatherCardView.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 15/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import SwiftUI

struct WeatherCardView: View {
    
    var currentWeather: WeatherInfo?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCardView(currentWeather: MockData.previewData())
    }
}
