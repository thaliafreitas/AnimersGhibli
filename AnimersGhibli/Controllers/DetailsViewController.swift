//
//  DetailsViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 18/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var scrollCollectionDetail: UIScrollView!
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDescription: UITextView!
    
    @IBOutlet weak var producerMovie: UILabel!
    @IBOutlet weak var releaseMovieData: UILabel!
    
//    @IBOutlet weak var location: UILabel!
    
    
    var imageDetails: UIImage?
    var movieTitlee: String?
    var movieDescriptionn: String?
    var producer: String?
    var releaseData: String?
    let colorTop =  UIColor(red: 197/255, green: 246/255, blue: 232/255, alpha: 1)
//    var movieLocation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageDetail.image = imageDetails
        movieTitle.text = movieTitlee
        movieDescription.text = movieDescriptionn
        producerMovie.text = producer
        releaseMovieData.text = releaseData
        
//        location.text = movieLocation
        scrollCollectionDetail.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+200)
        setBackfroundColor()
        movieDescription.backgroundColor = colorTop
    
            
        }
    func  setBackfroundColor() {
        
        
        self.view.backgroundColor = colorTop
    }



    

}
