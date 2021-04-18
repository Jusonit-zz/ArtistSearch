//
//  ArtistViewModel.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import Foundation

final class ArtistViewModel {
    
    var artistData = Response()
    
    var artistName: String = ""{
        didSet {
            getData(artistName: artistName)
        }
    }
    
    init(artistName: String) {
        if(artistName == "") { return }
        getData(artistName: artistName)
    }
    
    func dateFormatter(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        let dateFormatterPrint = DateFormatter()

        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatterPrint.dateFormat = "E, d MMM yyyy HH:mm"
        var formattedDate = "Error Formatting date"
        if let date = dateFormatterGet.date(from: date) {
            formattedDate = dateFormatterPrint.string(from: date)
            //print("Formatted Date : \(formattedDate)")
        }else {
             print("There was an error decoding the string")
        }
        return formattedDate
    }
    
    
    private func getData(artistName: String) {
        let urlString = API.getURLFor(artistName: artistName)
        getDataInternal(artistName: artistName, for: urlString)
    }
    
    private func getDataInternal(artistName: String, for urlString: String) {
        NetworkManager<Response>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            
            case .success(let response):
                DispatchQueue.main.async {
                    self.artistData = response
                }
                
            case .failure(let err):
                print(err)
            
            }
        }
    }
}
