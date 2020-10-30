//
//  ActorsInteractor.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - ActorsInteractorInput

/// _ActorsInteractorInput_ is a protocol for interactor input behaviours
protocol ActorsInteractorInput: ActorsViewControllerOutput {
    
}


// MARK: - ActorsInteractorOutput

/// _ActorsInteractorOutput_ is a protocol for interactor output behaviours
protocol ActorsInteractorOutput {
    
    /// Tells the output to present actors
    ///
    /// - parameter actors: The list of actors to present
    func presentActors(actors: People)
    
    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func presentError(error: Error)
}


// MARK: - ActorsInteractor

/// _ActorsInteractor_ is an interactor responsible for top actors business logic
final class ActorsInteractor {
    
    let output: ActorsInteractorOutput
    let worker: ActorsWorker
    
    var people: People?
    
    
    //MARK: - Initializers
    
    /// Initializes an instance of _ActorsInteractor_ with an output and a worker
    ///
    /// - parameter output: The interactors output
    /// - parameter worker: The actors worker used to fetch actors
    ///
    /// - returns: An instance of _ActorsInteractor_
    init(output: ActorsInteractorOutput, worker: ActorsWorker = ActorsWorker()) {
        
        self.output = output
        self.worker = worker
    }
}

extension ActorsInteractor: ActorsInteractorInput {
    
    ///Fetches a list of top actors through the worker
    func fetchActors(query: String?, page: Int) {
        
        worker.fetchActors(query: query, page: page) { [weak self] people, error in
            
            if let strongSelf = self {
                if let actorsError = error {
                    
                    strongSelf.output.presentError(error: actorsError)
                    
                } else if let people = people {
                    
                    strongSelf.people = people
                    strongSelf.output.presentActors(actors: people)
                }
            }
        }
    }
}
