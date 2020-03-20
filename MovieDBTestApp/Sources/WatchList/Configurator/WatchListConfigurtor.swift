//
//  WatchListConfigurator.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - WatchListConfigurator

/// _WatchListConfigurator_ is a class responsible for configuring the VIP scene pathways for _WatchListViewController_
final class WatchListConfigurator {
    
    /// Singleton instance of _WatchListConfigurator_
    static let sharedInstance = WatchListConfigurator()
    
    
    // MARK: - Configuration
    
    /// Configures the VIP scene with pathways between router, view controller, interactor and presenter
    ///
    /// - parameter viewController: The view controller
    func configure(viewController: WatchListViewController) {
        
        let router = WatchListRouter(viewController: viewController)
        let presenter = WatchListPresenter(output: viewController)
        let interactor = WatchListInteractor(output: presenter)
        
        viewController.output = interactor
        viewController.router = router
    }
}

