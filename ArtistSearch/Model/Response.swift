//
//  Response.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/18/21.
//

import Foundation

struct Response:Codable {
    var resultCount: Int
    var results: [Results]
    
    init() {
        resultCount = 0
        results = []
    }
    
    
}
