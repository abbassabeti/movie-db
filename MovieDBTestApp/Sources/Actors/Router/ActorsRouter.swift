//
//  ActorsRouter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit

// MARK: - ActorsRouterProtocol

/// _ActorsRouterProtocol_ is a protocol for router input behaviours
protocol ActorsRouterProtocol {
    
    var viewController: ActorsViewController? { get }
    
    /// Handles the navigation when selecting an actor in the list
    ///
    /// - parameter selectedActor: The selected actor to show details of
    func navigateToActorDetails(selectedActor: ActorsViewModel)
    
    /// Handles the navigation when selecting a movie in the list
    ///
    /// - parameter selectedMovie: The selected movie to show details of
    func navigateToMovieDetails(selectedMovie: MovieViewModel)
    
    func navigateToWatchLater(movies: [MovieViewModel])
}


// MARK: - ActorsRouter

/// _ActorsRouter_ is a class responsible for routing from _ActorsViewController_
final class ActorsRouter {
    
    weak var viewController: ActorsViewController?
    
    
    // MARK: - Initializers
    
    init(viewController: ActorsViewController) {
        
        self.viewController = viewController
    }
}

// MARK: - ActorsRouterProtocol

extension ActorsRouter: ActorsRouterProtocol {
    
    
    
    /// Handles the navigation when selecting an actor in the list to actor detail
    ///
    /// - parameter selectedActor: The selected actor to show details of
    func navigateToActorDetails(selectedActor: ActorsViewModel) {
        
        let actorDetailsViewController = ActorDetailsViewController(actor: selectedActor)
        viewController?.navigationController?.show(actorDetailsViewController, sender: viewController)
    }
    
    
    /// Handles the navigation when selecting an movie in the list to movie detail
    ///
    /// - parameter selectedMovie: The selected movie to show details of
    func navigateToMovieDetails(selectedMovie: MovieViewModel) {
        
        let movieDetailsViewController = MovieDetailsViewController(movie: selectedMovie)
        viewController?.navigationController?.show(movieDetailsViewController, sender: viewController)
    }
    
    func navigateToWatchLater(movies: [MovieViewModel]) {
        let watchListViewController = WatchListViewController(movies: movies)
        viewController?.navigationController?.show(watchListViewController, sender: viewController)
    }
}
