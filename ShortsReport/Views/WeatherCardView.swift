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
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("\(currentWeather?.name ?? "-")").fontWeight(.black)
                }
                HStack {
                    Text("\(currentWeather?.main.tempCString ?? "-")°").font(.largeTitle).bold()
                    Text("Feels like: \(currentWeather?.main.feelsLikeCString ?? "-")°").font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            HStack {
                VStack {
                    Image("\(currentWeather?.firstWeatherUnwrapped.icon ?? "50d")")
                }
            }
        }
        .padding()
        .background(Color(hex: "b1b493").opacity(0.5))
        .cornerRadius(20)
    }
}

struct WeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCardView(currentWeather: MockData.previewData())
            .previewLayout(.sizeThatFits)
    }
}
