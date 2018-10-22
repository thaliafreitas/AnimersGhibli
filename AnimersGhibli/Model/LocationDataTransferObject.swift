//
//  Locations.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 18/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

struct LocationDataTransferObject: Codable {

    let climate: String
    let films: [String]
    let name: String
    let residents: [String]
    let surfaceWater: String
    let terrain: String

    
    enum CodingKeys: String, CodingKey {
        case climate = "climate"
        case films = "films"
        case name = "name"
        case residents = "residents"
        case surfaceWater = "surface_water"
        case terrain = "terrain"
    }
}
