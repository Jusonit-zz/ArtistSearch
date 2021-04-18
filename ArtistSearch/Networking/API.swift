//
//  API.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import Foundation


struct API {
    static let baseURL = "https://itunes.apple.com/search?term"
    
    static func getURLFor(artistName: String)-> String {
        return "\(baseURL)=\(artistName)"
    }
}
