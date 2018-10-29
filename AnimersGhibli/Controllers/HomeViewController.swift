//
//  HomeViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 17/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIViewControllerPreviewingDelegate {
   
    
    
    
    let store = DataStore.sharedInstance
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if( traitCollection.forceTouchCapability == .available){
            
            registerForPreviewing(with: self, sourceView: view)
            
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        DataStore().saveFilms { (f) in
        
           self.store.filmesDTO = f
           self.collectionView.reloadData()
            
            f.forEach({ (movie) in
                CoreDataManager.sharedInstance.saveMovies(withTitle: movie.title, withMovieDescription: movie.movieDescription, withProducer: movie.producer, withReleaseData: movie.realeaseData)
            })
        }
        
        
        setBackfroundColor()
       
    }

  
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = collectionView?.indexPathForItem(at: location) else { return nil }
        
        guard let cell = collectionView?.cellForItem(at: indexPath) else { return nil }
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController else { return nil }
        let movie = store.filmesDTO[indexPath.row]
        
        
        let image = UIImage(named: movie.title)
        detailVC.imageDetails = image
        let movieTitle = movie.title
        detailVC.movieTitlee = movieTitle
        let mDescription = movie.movieDescription
        detailVC.movieDescriptionn = mDescription
        
        detailVC.preferredContentSize = CGSize(width: 0.0, height: 300)
        
        previewingContext.sourceRect = cell.frame
        
        return detailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
    
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.filmesDTO.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let colorTop =  UIColor(red: 197/255, green: 246/255, blue: 232/255, alpha: 1)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        let movie = store.filmesDTO[indexPath.row]
        
        
        cell.viewCollection(image: UIImage(named: movie.title), title: movie.title)
        
        
        
        collectionView.backgroundColor = colorTop
        
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
            vc.producer = store.filmesDTO[currentRow].producer
            vc.releaseData = store.filmesDTO[currentRow].realeaseData
            }
    }
    
    func  setBackfroundColor() {
        let colorTop =  UIColor(red: 197/255, green: 246/255, blue: 232/255, alpha: 1)
        
        self.view.backgroundColor = colorTop
    }

    
    
}

