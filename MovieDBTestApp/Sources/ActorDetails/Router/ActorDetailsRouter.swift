//
//  ActorDetailsRouter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - ActorDetailsRouterProtocol

/// _ActorDetailsRouterProtocol_ is a protocol for router input behaviours
protocol ActorDetailsRouterProtocol {
    
    var viewController: ActorDetailsViewController? { get }
    /// Handles the navigation when selecting a movie in the list
    ///
    /// - parameter indexPath: The selected index path
    func navigateToMovieDetails(movie: MovieViewModel)
}


// MARK: - ActorDetailsRouter

/// _ActorDetailsRouter_ is a class responsible for routing from _ActorDetailsViewController_
final class ActorDetailsRouter {
    
    weak var viewController: ActorDetailsViewController?
    
    
    // MARK: - Initializers
    
    /// Initializes a new instance of _ActorDetailsRouter_
    ///
    /// - paramter viewController: The _ActorDetailsViewController_ to route from
    ///
    /// - returns: The instance of _ActorDetailsRouter_
    init(viewController: ActorDetailsViewController) {
        
        self.viewController = viewController
    }
}

// MARK: - ActorDetailsRouter

extension ActorDetailsRouter: ActorDetailsRouterProtocol {
    
    
    /// Handles the navigation when selecting an actor in the list to actor detail
    ///
    /// - parameter indexPath: The selected index path
    func navigateToMovieDetails(movie : MovieViewModel) {
        
            let movieDetailsViewController = MovieDetailsViewController(movie: movie)
            viewController?.navigationController?.show(movieDetailsViewController, sender: viewController)
    }
}
