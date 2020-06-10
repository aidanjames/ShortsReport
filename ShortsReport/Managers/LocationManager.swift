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
    @Published var lastKnownLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
        start()
    }

    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
