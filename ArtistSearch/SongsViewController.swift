//
//  CollectionView.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/18/21.
//

import UIKit


class SongsViewController: UICollectionViewController {
    
    var songsViewModel: SongsViewModel!
    var updateUI: (() -> Void)?
    var searchString: String = "" {
        didSet {
            songsViewModel = SongsViewModel(artistName: searchString)
            songsViewModel.updateUI = {
                self.collectionView.reloadData()
                self.hideActivityIndicator()
            }
            
        }
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.backgroundColor = .white
        activityIndicator.frame = view.bounds
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        collectionView?.register(UINib(nibName: SongCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SongCollectionViewCell.reuseIdentifier)
    }
}


extension SongsViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songsViewModel.searchResponse.resultCount ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCollectionViewCell.reuseIdentifier, for: indexPath) as? SongCollectionViewCell,
              let songDetails = songsViewModel.searchResponse.results?[indexPath.row]
        else {
            return UICollectionViewCell()
        }
  
        let viewModel = CellViewModel(songDetails)
        cell.configure(viewModel: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height * 0.8)
    }
    
    
    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }

    func hideActivityIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.activityIndicator.stopAnimating()
        }
    }
}
