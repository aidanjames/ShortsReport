//
//  Date+Ext.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 22/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import Foundation


extension Date {
        
    func minutesBetweenDates() -> Double {

        //get both times sinces refrenced date and divide by 60 to get minutes
        let newDateMinutes = Date().timeIntervalSinceReferenceDate/60
        let oldDateMinutes = self.timeIntervalSinceReferenceDate/60

        //then return the difference
        return newDateMinutes - oldDateMinutes
    }
    
}
