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
    @IBOutlet weak var searchButtonOutlet: UIButton!
    
    let activityIndicator = UIActivityIndicatorView()
    
    @IBAction func searchButton(_ sender: Any) {
        if artistSearchBar.text != nil {
            
            var searchName = String(artistSearchBar.text!)
            searchName = String(searchName.filter { !" \n\t\r".contains($0) })
            //print("Searching:", searchName)
            //let data = ArtistViewModel(artistName: String(artistSearchBar.text!))
            let CollectionScreen = storyboard?.instantiateViewController(identifier: "CollectionView") as! CollectionView
            //CollectionScreen.searchName = String(artistSearchBar.text!)
            self.activityIndicator.style = UIActivityIndicatorView.Style.large
            activityIndicator.color = .black
            
            activityIndicator.frame = CGRect(x: Int(view.bounds.maxX*0.5), y: Int(view.bounds.maxY*0.5+50), width: 50, height: 50)
            
            CollectionScreen.data = ArtistViewModel(artistName: searchName, indicator: activityIndicator)
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
