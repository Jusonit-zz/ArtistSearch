//
//  Artist.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import Foundation

struct Results:Codable {
    var artistName: String
    var trackName: String
    var trackPrice: Double
    var releaseDate: String //date
    var primaryGenreName: String
    
    init() {
        artistName = ""
        trackName = ""
        trackPrice = 0.0
        releaseDate = ""
        primaryGenreName = ""
    }
}
