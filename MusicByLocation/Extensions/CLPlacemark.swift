//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Audley-Williams, Schuyler (SPH) on 02/03/2022.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationBreakDown() -> String {
        return
            """
            Street: \(self.thoroughfare ?? "None")
            City: \(self.locality ?? "None")
            Area: \(self.administrativeArea ?? "None")
            Country: \(self.country ?? "None")
            """
    }
}
