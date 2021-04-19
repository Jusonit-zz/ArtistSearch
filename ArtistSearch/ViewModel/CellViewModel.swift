//
//  CellViewModel.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import Foundation

struct CellViewModel {
    let artistName: String?
    let trackName: String?
    let releaseDate: String?
    let primaryGenreName: String?
    let trackPrice: String?
    init(_ songDetails: SongDetails) {
        self.artistName = songDetails.artistName
        self.trackName = songDetails.trackName
        self.releaseDate = songDetails.releaseDate
        self.primaryGenreName = songDetails.primaryGenreName
        self.trackPrice = "$" + String(songDetails.trackPrice ?? 0)
    }
}
