//
//  DetailsViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 18/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDescription: UITextView!
    
    
//    @IBOutlet weak var location: UILabel!
    
    
    var imageDetails: UIImage?
    var movieTitlee: String?
    var movieDescriptionn: String?
//    var movieLocation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageDetail.image = imageDetails
        movieTitle.text = movieTitlee
        movieDescription.text = movieDescriptionn
//        location.text = movieLocation
       
    
            
        }



    

}
