//
//  CoreDataManager.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 23/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit
import CoreData


class CoreDataManager {
    static let sharedInstance = CoreDataManager()
    var characters: [Character] = []
    var movies: [Movie] = []
    let context: NSManagedObjectContext
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    private init(){
        context  = appDelegate.persistentContainer.viewContext
    }
    
    func saveCharacter(withName name:String = "", withGender gender:String  = "", withAge age: String = "", withEyeColor eyeColor: String = "", withHairColor hairColor: String, andSpecie specie: String = "") {
        let character = Character(context: context)
        
        character.name = name
        character.gender = gender
        character.age = age
        character.specie = specie
        character.hairColor = hairColor
        character.eyeColor = eyeColor
        
        
        do{
            try context.save()
        } catch{
            fatalError("Failure to get context\(error)")
        }
    }
    
    func fetchCharacters(){
        
        let charactersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Character")
        
        do{
            let fetchedCharacters = try context.fetch(charactersFetch) as! [Character]
            self.characters = fetchedCharacters

        }catch{
            fatalError("Failed to fetch character: \(error)")
        }
    }
    
    
    
    func saveMovies(withTitle title:String = "", withMovieDescription movieDescription:String  = "", withProducer producer: String = "", withReleaseData releaseData: String = "") {
        
        let fetchedMovies = fetchMovies()
        
        
        if fetchedMovies.count < 20 {
            let movie = Movie(context: context)
            
            movie.producer = producer
            movie.releaseData = releaseData
            movie.title = title
            movie.movieDescription = movieDescription
        
            do{
                try context.save()
            } catch{
                fatalError("Failure to get context\(error)")
            }
        }
    }
    
    
   
        

    func fetchMovies() -> [Movie]{
        
        let moviesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        
        do{
            let fetchedMovies = try context.fetch(moviesFetch) as! [Movie]
            if fetchedMovies.count != 0 {
                self.movies = fetchedMovies
                self.movies = fetchedMovies.sorted {return $0.title! < $1.title!}
            }
            
            return fetchedMovies
            
            //            self.characters = fetchedCharacters.sorted(by: { return $0.na < $1.id})
        }catch{
            fatalError("Failed to fetch character: \(error)")
        }
        
        
        return [Movie]()
    }
    
    
    func resetCoreData() {
        
        let moviesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        
        do{
            let fetchedMovies = try context.fetch(moviesFetch) as! [Movie]
            for movie in fetchedMovies{
                context.delete(movie)
            }
            try context.save()
            self.movies = []
        }catch{
            fatalError("Failed to fetch character: \(error)")
        }
    }
    func executeThe(query: NSPredicate, forEntityName entity: String ) -> [NSManagedObject]{

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.predicate = query
        do {
            let result = try context.fetch(request)
            return result as! [NSManagedObject]
            
        } catch {
            print("Failed query")
        }
        return []
        
}

}
