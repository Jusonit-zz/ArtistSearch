//
//  CollectionView.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/18/21.
//

import UIKit


class CollectionView: UICollectionViewController {
    
    var data = ArtistViewModel(artistName: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.register(UINib(nibName: CollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        }

        // Do any additional setup after loading the view.
    }
}


extension CollectionView: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.artistData.resultCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let artistName = data.artistName
        let trackName = data.artistData.results[indexPath.row].trackName
        
        var releaseDate = data.artistData.results[indexPath.row].releaseDate
        releaseDate = data.dateFormatter(date: releaseDate)
        
        
        let primaryGenreName = data.artistData.results[indexPath.row].primaryGenreName
        let trackPrice = data.artistData.results[indexPath.row].trackPrice

        
        cell.configure(artistName: artistName, trackName: trackName, releaseDate: releaseDate, primaryGenreName: primaryGenreName, trackPrice: trackPrice)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height * 0.8)
    }
    
    func randColor() -> CGFloat {
        return CGFloat.random(in: 0...255) / 255
    }
}
