//
//  StateController.swift
//  MusicByLocation
//
//  Created by Audley-Williams, Schuyler (SPH) on 02/03/2022.
//

import Foundation

class StateController: ObservableObject {
    @Published var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsByLocation)
        }
    }
    @Published var artistNames: String = ""
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsByLocation(artists: [Artist]?) {
        let names = artists?.map { return $0.name }
        DispatchQueue.main.async {
            self.artistNames = names?.joined(separator: ", ") ?? "error"
        }
    }
}
