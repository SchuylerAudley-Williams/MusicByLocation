//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by Audley-Williams, Schuyler (SPH) on 07/03/2022.
//

import Foundation

class ITunesAdaptor {
    let baseUrl = "https://itunes.apple.com"
    
    func getArtists(search: String, completion: @escaping ([Artist]?) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(search)&entity=musicArtist")
        else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
                    if let data = data {
                        if let response = self.parseJson(json: data) {
                            completion(response.results)
                        } else {
                            completion(nil)
                        }
                    }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("error decoding json")
            return nil
        }
        
    }
}
