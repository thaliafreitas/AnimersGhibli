//
//  Species.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 18/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

struct SpecieDataTransferObject: Codable {

    var name: String
    var classification: String
    var eyes: String
    var hairs: String
    var people: [String]
    var films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case classification = "classification"
        case eyes = "eye_colors"
        case hairs = "hair_colors"
        case films = "films"
        case people = "people"
    }
}
