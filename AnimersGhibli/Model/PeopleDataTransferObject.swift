//
//  PeopleDataTransferObject.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 18/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class PeopleDataTransferObject: Codable {
    var name: String?
    var gender: String?
    var age: String?
    var eye: String?
    var hairColor: String?
    var films: [String]
    var species: String?
    
    init(name: String, genter: String, age: String, eye: String, hairColor: String, films: [String], species: String) {
        self.name = name
        self.gender = genter
        self.age = age
        self.eye = eye
        self.hairColor = hairColor
        self.films = films
        self.species = species
    }
    

    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gender = "gender"
        case age = "age"
        case eye = "eye_color"
        case hairColor = "hair_color"
        case films = "films"
        case species = "species"
 
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let age = try values.decode(String.self, forKey: .age)
        let eye = try values.decode(String.self, forKey: .eye)
        let films = try values.decode([String].self, forKey: .films)
        let gender = try values.decode(String.self, forKey: .gender)
        let hairColor = try values.decode(String.self, forKey: .hairColor)
        let name = try values.decode(String.self, forKey: .name)
        let species = try values.decode(String.self, forKey: .species)
        
        // Requisiçao
        let url = URL(string: species)!
        
        self.init(name: name, genter: gender, age: age, eye: eye, hairColor: hairColor, films: films, species: species)
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                self.species = (json["name"] as! String)
//                self.[films].[0] = (json["title"]) as! String)
            } catch {
                print("Could not get API data location. \(error), \(error.localizedDescription)")
            }
//            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()


        

    }
}
