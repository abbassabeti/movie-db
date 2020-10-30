//
//  ActorConfigurator.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - ActorDetailsConfigurator

/// _ActorDetailsConfigurator_ is a class responsible for configuring the VIP scene pathways for _ActorDetailsViewController_
final class ActorDetailsConfigurator {
    
    /// Singleton instance of _ActorDetailsConfigurator_
    static let sharedInstance = ActorDetailsConfigurator()
    
    
    // MARK: - Configuration
    
    /// Configures the VIP scene with pathways between router, view controller, interactor and presenter
    ///
    /// - parameter viewController: The view controller
    func configure(viewController: ActorDetailsViewController) {
        
        let router = ActorDetailsRouter(viewController: viewController)
        let presenter = ActorDetailsPresenter(output: viewController)
        let interactor = ActorDetailsInteractor(output: presenter)
        
        viewController.output = interactor
        viewController.router = router
    }
}
