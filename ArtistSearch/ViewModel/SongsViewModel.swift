//
//  SongsViewModel.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import Foundation

final class SongsViewModel {
    
    var searchResponse = SearchResponse()
    var cellViewModels: [CellViewModel] = []
    
    var updateUI: (() -> Void)?
    var artistName = ""
    
    init(artistName: String) {
        getData(artistName: artistName)
    }
    
    private func getData(artistName: String) {
        let urlString = API.getURLFor(artistName: artistName)
        getDataInternal(artistName: artistName, for: urlString)
    }
    
    private func getDataInternal(artistName: String, for urlString: String) {
        NetworkManager<SearchResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.searchResponse = response
                    self.updateUI?()

                }
            case .failure(let err):
                print(err)
            
            }
        }
    }
}
    
//Singleton date formatter
class dateFormat {
    static let shared = dateFormat()
    private init() {}
    func dateFormatter(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        let dateFormatterPrint = DateFormatter()

        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatterPrint.dateFormat = "E, d MMM yyyy HH:mm"
        var formattedDate = "Error Formatting date"
        if let date = dateFormatterGet.date(from: date) {
            formattedDate = dateFormatterPrint.string(from: date)
        }else {
             print("There was an error decoding the string")
        }
        return formattedDate
    }
}

