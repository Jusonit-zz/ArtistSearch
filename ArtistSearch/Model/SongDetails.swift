//
//  Artist.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import Foundation

// Todo: Cache data into file
struct SongDetails: Codable {
    var artistName: String?
    var trackName: String?
    var trackPrice: Double?
    var releaseDate: String?
    var primaryGenreName: String?
}
