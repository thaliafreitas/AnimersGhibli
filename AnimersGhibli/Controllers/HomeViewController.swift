//
//  HomeViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 17/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let store = DataStore.sharedInstance
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        DataStore().saveFilms { (f) in
           self.store.filmesDTO = f
           self.collectionView.reloadData()
        }
       
    }
    
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.filmesDTO.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        let movie = store.filmesDTO[indexPath.row]

        
        cell.viewCollection(image: UIImage(named: movie.title), title: movie.title)
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView.cellForItem(at: indexPath) != nil else { return }
        
        performSegue(withIdentifier: "next", sender: indexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "next"){
            let vc = segue.destination as! DetailsViewController
            let currentRow = sender as! Int
            vc.movieTitlee = store.filmesDTO[currentRow].title
            vc.movieDescriptionn = store.filmesDTO[currentRow].movieDescription
            vc.imageDetails = UIImage(named: store.filmesDTO[currentRow].title)
            }
    }

    
    
}
