//
//  Parsable.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation

// MARK: - Parsable

/// _Parsable_ is a protocol to specify parsing behaviour
protocol Parsable {
    
    associatedtype T
    
    /// Converts a JSON dictionary into a generic object type T
    ///
    /// - parameter json: JSON dictionary
    ///
    /// - returns: The generic object type
    static func fromJson(json: [String: Any]) -> T?
}
