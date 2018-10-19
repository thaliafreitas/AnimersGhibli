//
//  Locations.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 18/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

struct LocationDataTransferObject: Codable {

    var location: [String]
    
    enum CodingKeys: String, CodingKey {
        case location = "locations"
    }
}
