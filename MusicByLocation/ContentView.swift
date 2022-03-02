//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Audley-Williams, Schuyler (SPH) on 02/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
        VStack{
            Text(state.artistNames)
            Text(state.lastKnownLocation)
                .padding()
            Spacer()
            Button("Find Music", action: {state.findMusic()})
        }.onAppear(perform: {
            state.requestAccessToLocationData()
            state.getArtists(city: state.lastKnownLocation)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
