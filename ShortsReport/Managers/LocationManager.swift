//
//  LocationManager.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 10/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    private let manager = CLLocationManager()
    @Published var lastKnownLocation: CLLocationCoordinate2D? {
        // This will stop updating the location once we have coordinates
        didSet {
            stop()
        }
    }

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.start()

        }
    }

    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func stop() {
        manager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
