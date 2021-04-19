//
//  ViewController.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchViewModel = SearchViewModel()
    
    @IBOutlet weak var artistSearchBar: UITextField!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    @IBAction func searchButton(_ sender: Any) {
        searchViewModel.searchName = artistSearchBar.text
        if searchViewModel.isSearchTextValid {
            showSongsViewController()
        } else {
            let alert = UIAlertController(title: "Alert", message: "Name required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //print("no name")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showSongsViewController() {
        guard let songsViewController = storyboard?.instantiateViewController(identifier: "CollectionView") as? SongsViewController else {
            return
        }
        
        songsViewController.searchString = searchViewModel.getFormattedString()
        self.navigationController?.pushViewController(songsViewController, animated: true)
    }
}
