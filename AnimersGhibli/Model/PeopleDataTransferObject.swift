//
//  PeopleDataTransferObject.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 18/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

struct PeopleDataTransferObject: Codable {
    var name: String
    var gender: String
    var age: String
    var eye: String
    var hairColor: String
    var films: [String]
    var species: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gender = "gender"
        case age = "age"
        case eye = "eye_color"
        case hairColor = "hair_color"
        case films = "films"
        case species = "species"
 
    }
    
    

}
