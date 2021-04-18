//
//  ViewController.swift
//  ArtistSearch
//
//  Created by Rave Bizz on 4/17/21.
//

import UIKit

class ViewController: UIViewController {
    
    //var data = ArtistViewModel()
    
    
    @IBOutlet weak var artistSearchBar: UITextField!
    
    @IBAction func searchButton(_ sender: Any) {
        if artistSearchBar.text != nil {
            //let data = ArtistViewModel(artistName: String(artistSearchBar.text!))
            let CollectionScreen = storyboard?.instantiateViewController(identifier: "CollectionView") as! CollectionView
            //CollectionScreen.searchName = String(artistSearchBar.text!)
            CollectionScreen.data = ArtistViewModel(artistName: String(artistSearchBar.text!))
            present(CollectionScreen, animated: true, completion: nil)
        }
        else
        {
            print("no name")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
