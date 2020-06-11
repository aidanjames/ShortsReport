//
//  ViewModel.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 11/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

class ViewModel: ObservableObject {
    
    @Published var canWearShorts: Bool?
    
    
    func toggleShortsWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.canWearShorts == nil {
                self.canWearShorts = true
            } else {
                self.canWearShorts?.toggle()
            }
        }
    }
    
}
