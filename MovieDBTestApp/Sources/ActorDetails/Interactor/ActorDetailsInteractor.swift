//
//  ActorDetailsInteractor.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - ActorDetailsInteractorInput

/// _ActorDetailsInteractorInput_ is a protocol for interactor input behaviours
protocol ActorDetailsInteractorInput: ActorDetailsViewControllerOutput {
    
}


// MARK: - ActorDetailsInteractorInput

/// _ActorDetailsInteractorOuput_ is a protocol for interactor output behaviours
protocol ActorDetailsInteractorOutput {
    
    /// Tells the output to present movies
    ///
    /// - parameter movie: The movie to present
    func presentMovie(movie: Movie)
    
    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func presentError(error: Error)
}


// MARK: - ActorDetailsInteractor

/// _ActorDetailsInteractor_ is an interactor responsible for actor details business logic
final class ActorDetailsInteractor: ActorDetailsInteractorInput {
    
    func addToWatchList(actorId: Int) {
        
    }
    
    func removeFromWatchList(actorId: Int) {
        
    }
    
    let output: ActorDetailsInteractorOutput
    let worker: ActorDetailsWorker
    
    var movies: [Movie]?
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _ActorDetailsInteractor_ with an output and a worker
    ///
    /// - parameter output: The interactor output
    /// - parameter worker: The movie worker used to fetch movies
    ///
    /// - returns: An instance of _ActorDetailsInteractor_
    init(output: ActorDetailsInteractorOutput, worker: ActorDetailsWorker = ActorDetailsWorker()){
        
        self.output = output
        self.worker = worker
    }
    
    
    // MARK: - Business logic
    
    /// Fetches a list of top movies for an actor (is not required for now)
}
