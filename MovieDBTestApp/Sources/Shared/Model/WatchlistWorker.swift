//
//  ActorsWorker.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit
import CoreData


extension Notification.Name {
    
    static let favoriteUpdated = Notification.Name("favorite-updated")
}

// MARK: - WatchlistWorker

/// _WatchlistWorker_ is a worker object responsible to fetch movies from a store
class WatchlistWorker {
    
    static let sharedInstance = WatchlistWorker()
    
    fileprivate var currentMovies: [MovieViewModel]? {
        didSet {
            NotificationCenter.default.post(name: .favoriteUpdated, object: currentMovies)
        }
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    
    
    init() {
        context = appDelegate.persistentContainer.viewContext
    }
    // MARK: - Business Logic
    
    func hasMovie(movie: MovieViewModel) -> Bool {
        if let index = movieIndex(movie: movie){
            return index > -1
        }else {
            return false
        }
    }
    
    func movieIndex(movie: MovieViewModel) -> Array<Any>.Index? {
        let index = currentMovies?.firstIndex(where: { (item) -> Bool in
            item.id == movie.id
        })
        return index
    }
    
    func toggleMovie(movie: MovieViewModel) -> Bool{
        if let index = movieIndex(movie: movie){
            return index > -1 ?  removeMovie(movie: movie) : saveMovie(movie: movie)
        }else{
            return saveMovie(movie: movie)
        }
    }
    
    /// Fetches watchlist movies from a core data
    ///
    func loadMovies() -> [MovieViewModel]? {
        var movies : [MovieViewModel] = []
        guard let context = context else {
            return nil
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WatchlistItem")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: "id") as? Int ?? 0
                let backdrop = URL(string: data.value(forKey: "backdrop_path") as? String ?? "")
                let overview = data.value(forKey: "overview") as? String ?? ""
                let release_date = data.value(forKey: "release_date") as? String ?? ""
                let title = data.value(forKey: "title") as? String ?? ""
                let vote_count = data.value(forKey: "vote_count") as? Int ?? 0
                let vote_average = data.value(forKey: "vote_average") as? Float ?? 0
                let original_name = data.value(forKey: "original_name") as? String ?? ""
                movies.append(MovieViewModel(title: title, backdropPath: backdrop, vote_average: vote_average, vote_count: vote_count, overview: overview, release_date: release_date, id: id, original_name: original_name))
            }
            currentMovies = movies
            return movies
            
        } catch {
            print("Failed")
            return nil
        }
    }
    
    func removeMovie(movie: MovieViewModel) -> Bool {
        guard let context = context else {
            return false
        }
        guard let id = movie.id else {return false}
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WatchlistItem")
        request.predicate = NSPredicate(format: "id = \(id)")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
            
            try context.save()
            
            if let index = movieIndex(movie: movie){
            
                if (index > -1) {
                    currentMovies?.remove(at: index)
                }
            }
            
            return true
            
        } catch {
            print("Failed")
            return false
        }
    }
    
    // MARK: - Business Logic
    
    /// saves movie watchlist movies from a core data
    ///
    /// - parameter movie: The movie which should be saved in watch list or remove from it
    /// - parameter completion: The completion block
    func saveMovie(movie: MovieViewModel) -> Bool{
        guard let context = context else {
            return false
        }
        let entity = NSEntityDescription.entity(forEntityName: "WatchlistItem", in: context)
        let newMovie = NSManagedObject(entity: entity!, insertInto: context)
        
        newMovie.setValue(movie.id, forKey: "id")
        newMovie.setValue(movie.backdropPath?.absoluteString, forKey: "backdrop_path")
        newMovie.setValue(movie.overview, forKey: "overview")
        newMovie.setValue(movie.release_date, forKey: "release_date")
        newMovie.setValue(movie.title, forKey: "title")
        newMovie.setValue(movie.vote_average, forKey: "vote_average")
        newMovie.setValue(movie.vote_count, forKey: "vote_count")
        
        do {
            try context.save()
            currentMovies?.append(movie)
            return true
        }catch {
            return false
        }
    }
    
    func removeAll() -> Bool{
        guard let context = context else {
            return false
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WatchlistItem")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
            
            try context.save()
            
            currentMovies = []
            
            return true
            
        } catch {
            print("Failed")
            return false
        }
    }
    
    func getCurrentMovies() -> [MovieViewModel]? {
        return currentMovies
    }
}

