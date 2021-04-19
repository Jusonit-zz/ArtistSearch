//
//  CellViewModel.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import Foundation

class SearchViewModel {
    
    var searchName: String?
    
    var isSearchTextValid: Bool {
        searchName != nil && !(searchName?.isEmpty ?? true)
    }
    
    func getFormattedString() -> String {
        if let searchName = searchName {
            var formattedName = searchName
            formattedName = String(searchName.filter { !" \n\t\r".contains($0) })
            return formattedName
        } else {
            return ""
        }
    }
}
