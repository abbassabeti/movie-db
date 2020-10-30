//
//  ErrorViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation

/// _ErrorViewModel_ is a view model containing info related to displaying an error
class ErrorViewModel {
    
    let title: String?
    let message: String?
    let buttonTitles: [String]?
    
    init(title: String?, message: String?, buttonTitles: [String]?) {
        self.title = title
        self.message = message
        self.buttonTitles = buttonTitles
    }
}
