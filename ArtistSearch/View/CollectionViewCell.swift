//
//  CollectionViewCell.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/18/21.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CollectionViewCell"
    
    @IBOutlet weak var primaryGenreName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var artistName: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(artistName: String, trackName: String, releaseDate: String, primaryGenreName: String, trackPrice: Double) {
        self.artistName.text = artistName
        self.trackName.text = trackName
        self.releaseDate.text = releaseDate
        self.primaryGenreName.text = primaryGenreName
        self.trackPrice.text = String(trackPrice)
    }

}
