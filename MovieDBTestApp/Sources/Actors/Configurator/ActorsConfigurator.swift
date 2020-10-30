//
//  ActorsConfigurator.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit

// MARK: - ActorsConfigurator

/// _ActorsConfigurator_ is a class responsible for configuring the VIP scene pathways for _ActorsViewController_

final class ActorsConfigurator {
    
    /// Singleton instance of _ArtistsConfigurator_
    static let sharedInstance = ActorsConfigurator()
    
    
    // MARK: - Configuration
    
    /// Configures the VIP scene with pathways between router, view controller, interactor and presenter
    ///
    /// - parameter viewController: The view controller
    func configure(viewController: ActorsViewController) {
        
        let router = ActorsRouter(viewController: viewController)
        let presenter = ActorsPresenter(output: viewController)
        let interactor = ActorsInteractor(output: presenter)
        
        viewController.output = interactor
        viewController.router = router
    }
}
