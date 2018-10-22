//
//  APIManager.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 16/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class APIManager {
    
    static func fetchAll(completion: @escaping ([MovieDataTransferModel]?) -> Void) {
        
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode([MovieDataTransferModel].self, from: unwrappedDAta)
                DispatchQueue.main.async {
                    completion(movies)
                }
            } catch {
                print("Could not get API data all. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    static func getPeople(completion: @escaping ([PeopleDataTransferObject]?) -> Void) {
        
        let url = URL(string: "https://ghibliapi.herokuapp.com/people/")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let decoder = JSONDecoder()
                let people = try decoder.decode([PeopleDataTransferObject].self, from: unwrappedDAta)
                DispatchQueue.main.async {
                    completion(people)
                    print(people)

                }
            } catch {
                print("Could not get API data people. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    
    static func getLocation(completion: @escaping ([LocationDataTransferObject]?) -> Void) {
        
        let url = URL(string: "https://ghibliapi.herokuapp.com/locations")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let decoder = JSONDecoder()
                let locations = try decoder.decode([LocationDataTransferObject].self, from: unwrappedDAta)
                DispatchQueue.main.async {
                    completion(locations)
                }
                
            } catch {
                print("Could not get API data location. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    static func getSpecie(completion: @escaping ([SpecieDataTransferObject]?) -> Void) {
        
        let url = URL(string: "https://ghibliapi.herokuapp.com/species")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }

            do {
                let decoder = JSONDecoder()
                let species = try decoder.decode([SpecieDataTransferObject].self, from: unwrappedDAta)
                DispatchQueue.main.async {
                    completion(species)
                }
//                print(species)

            } catch {
                print("Could not get API data specie. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    static func getVehicle(completion: @escaping ([VehicleDataTransferObject]?) -> Void) {
        
        let url = URL(string: "https://ghibliapi.herokuapp.com/vehicles")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let decoder = JSONDecoder()
                let vehicles = try decoder.decode([VehicleDataTransferObject].self, from: unwrappedDAta)
                DispatchQueue.main.async {
                    completion(vehicles)
                }
            } catch {
                print("Could not get API data vehicle. \(error), \(error.localizedDescription)")
            }
        
        }
        
        dataTask.resume()
    }
    
    
    
}
