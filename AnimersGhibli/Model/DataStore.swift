//
//  DataStore.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 17/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class DataStore {
    
    static let sharedInstance = DataStore()
    var filmesDTO : [MovieDataTransferModel] = []
    var peopleDTO : [PeopleDataTransferObject] = []
    var locationDTO : [LocationDataTransferObject] = []
    var specieDTO : [SpecieDataTransferObject] = []
    var vehicleDTO : [VehicleDataTransferObject] = []
    
    
    func getFilms(completion: @escaping ([MovieDataTransferModel]) -> Void) {
        
        APIManager.fetchAll { (filmes) in
            self.filmesDTO = filmes ?? []
            completion(self.filmesDTO)
        }
    }
    
    func getPeople(completion: @escaping ([PeopleDataTransferObject]) -> Void) {
        APIManager.getPeople { (people) in
            self.peopleDTO = people ?? []
            completion(self.peopleDTO)
        }
       
    }
    
    func getLocation(completion: @escaping ([LocationDataTransferObject]?) -> Void) {
        APIManager.getLocation { (location) in
            self.locationDTO = location ?? []
            completion(self.locationDTO)
        }

    }
    
    func getSpecie(completion: @escaping ([SpecieDataTransferObject]?) -> Void) {
        APIManager.getSpecie { (specie) in
            self.specieDTO = specie ?? []
            completion(self.specieDTO)
        }
    }
    
    func getVehicle(completion: @escaping ([VehicleDataTransferObject]?) -> Void) {
        APIManager.getVehicle { (vehicle) in
            self.vehicleDTO = vehicle ?? []
            completion(self.vehicleDTO)
        }
    }


}
    


