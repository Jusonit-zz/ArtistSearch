//
//  Response.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/18/21.
//

import Foundation

struct SearchResponse: Codable {
    var resultCount: Int?
    var results: [SongDetails]?
}
