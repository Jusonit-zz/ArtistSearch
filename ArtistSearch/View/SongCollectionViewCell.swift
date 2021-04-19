//
//  SongCollectionViewCell.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/18/21.
//

import UIKit


class SongCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SongCollectionViewCell"
    
    @IBOutlet weak var primaryGenreName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    var viewModel: CellViewModel? {
        didSet {
            self.updateLabels()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 10
    }
    
    func configure(viewModel: CellViewModel) {
        self.viewModel = viewModel
    }
    
    func updateLabels() {
        if let viewModel = viewModel {
            self.artistName.text = viewModel.artistName
            self.trackName.text = viewModel.trackName
            self.releaseDate.text = viewModel.releaseDate
            self.primaryGenreName.text = viewModel.primaryGenreName
            self.trackPrice.text = viewModel.trackPrice
        }
    }

}
