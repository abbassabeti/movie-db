//
//  MovieDetailsRouter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - MovieDetailsRouterProtocol

/// _MovieDetailsRouterProtocol_ is a protocol for router input behaviours
protocol MovieDetailsRouterProtocol {
    
    var viewController: MovieDetailsViewController? { get }
}


// MARK: - MovieDetailsRouter

/// _MovieDetailsRouter_ is a class responsible for routing from _MovieDetailsViewController_
final class MovieDetailsRouter: MovieDetailsRouterProtocol {
    
    weak var viewController: MovieDetailsViewController?
    
    
    // MARK: - Initializers
    
    /// Initializes a new instance of _MovieDetailsRouter_
    ///
    /// - paramter viewController: The _MovieDetailsViewController_ to route from
    ///
    /// - returns: The instance of _MovieDetailsRouter_
    init(viewController: MovieDetailsViewController) {
        
        self.viewController = viewController
    }
}

