//
//  WatchListInteractor.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - WatchListInteractorInput

/// _WatchListInteractorInput_ is a protocol for interactor input behaviours
protocol WatchListInteractorInput: WatchListViewControllerOutput {
    
}


// MARK: - WatchListInteractorInput

/// _WatchListInteractorOuput_ is a protocol for interactor output behaviours
protocol WatchListInteractorOutput {
    
    /// Tells the output to present movies
    ///
    /// - parameter movie: The movie to present
    func presentMovies(movies: [MovieViewModel])
    
    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func presentError(error: Error)
}


// MARK: - WatchListInteractor

/// _WatchListInteractor_ is an interactor responsible for actor details business logic
final class WatchListInteractor: WatchListInteractorInput {
    
    func addToWatchList(actorId: Int) {
        
    }
    
    func removeFromWatchList(actorId: Int) {
        
    }
    
    let output: WatchListInteractorOutput
    let worker: WatchlistWorker
    
    var movies: [Movie]?
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _WatchListInteractor_ with an output and a worker
    ///
    /// - parameter output: The interactor output
    /// - parameter worker: The movie worker used to fetch movies
    ///
    /// - returns: An instance of _WatchListInteractor_
    init(output: WatchListInteractorOutput, worker: WatchlistWorker = WatchlistWorker()){
        
        self.output = output
        self.worker = worker
    }
    
    
    // MARK: - Business logic
    
    
}

