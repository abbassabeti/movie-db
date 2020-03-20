//
//  WatchListRouter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - WatchListRouterProtocol

/// _WatchListRouterProtocol_ is a protocol for router input behaviours
protocol WatchListRouterProtocol {
    
    var viewController: WatchListViewController? { get }
    /// Handles the navigation when selecting a movie in the list
    ///
    /// - parameter indexPath: The selected index path
    func navigateToMovieDetails(movie: MovieViewModel)
}


// MARK: - WatchListRouter

/// _WatchListRouter_ is a class responsible for routing from _WatchListViewController_
final class WatchListRouter {
    
    weak var viewController: WatchListViewController?
    
    
    // MARK: - Initializers
    
    /// Initializes a new instance of _WatchListRouter_
    ///
    /// - paramter viewController: The _WatchListViewController_ to route from
    ///
    /// - returns: The instance of _WatchListRouter_
    init(viewController: WatchListViewController) {
        
        self.viewController = viewController
    }
}

// MARK: - WatchListRouterProtocol

extension WatchListRouter: WatchListRouterProtocol {
    
    /// Handles the navigation when selecting a movie in the list of movies
    ///
    /// - parameter indexPath: The selected index path
    func navigateToMovieDetails(movie : MovieViewModel) {
        
        let movieDetailsViewController = MovieDetailsViewController(movie: movie)
        viewController?.navigationController?.show(movieDetailsViewController, sender: viewController)
    }
}

