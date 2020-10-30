//
//  Strings.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


/// _Strings_ is a struct responsible to hold all the strings in this application
struct Strings {
    
    struct Actors {
        
        static let screenTitle = NSLocalizedString("Top Actors", comment: "Top Actors screen title")
        static let favoriteMovies = NSLocalizedString("Watch Later", comment: "Watch later movies")
    }
    
    struct Artist {
        
        static let screenTitle = NSLocalizedString("Actor", comment: "Actor screen title")
        static let movieTitle = NSLocalizedString("Top Movies", comment: "Movie header title")
    }
    
    struct Error {
        
        static let genericTitle = NSLocalizedString("Sorry", comment: "Generic Error title")
        static let genericMessage = NSLocalizedString("Something went wrong.", comment: "Generic error message")
        static let okButtonTitle = NSLocalizedString("Ok", comment: "Alert button title")
    }
    
}
