//
//  MovieDataTransferObject.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 17/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import Foundation
import UIKit

struct MovieDataTransferModel: Codable {
    
    var title: String
    var movieDescription: String
    var image: UIImage?
    var people: [String]
    var location: [String]
    var vehicle: [String]
    var specie: [String]
    var director: String
    var producer: String
    var realeaseData: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case movieDescription = "description"
        case people = "people"
        case location = "locations"
        case vehicle = "vehicles"
        case specie = "species"
        case director = "director"
        case producer = "producer"
        case realeaseData = "release_date"
        
    }
    
}
