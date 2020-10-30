//
//  MovieDetailsConfigurator.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - MovieDetailsConfigurator

/// _MovieDetailsConfigurator_ is a class responsible for configuring the VIP scene pathways for _MovieDetailsViewController_
final class MovieDetailsConfigurator {
    
    /// Singleton instance of _MovieDetailsConfigurator_
    static let sharedInstance = MovieDetailsConfigurator()
    
    
    // MARK: - Configuration
    
    /// Configures the VIP scene with pathways between router, view controller, interactor and presenter
    ///
    /// - parameter viewController: The view controller
    func configure(viewController: MovieDetailsViewController) {
        
        let router = MovieDetailsRouter(viewController: viewController)
        let presenter = MovieDetailsPresenter(output: viewController)
        let interactor = MovieDetailsInteractor(output: presenter)
        
        viewController.output = interactor
        viewController.router = router
    }
}
