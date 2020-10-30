//
//  ActorsStoreProtocol.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - ActorsStoreError

/// _ActorsStoreError_ is an enumeration for actor store errors
///
/// - generic:          Generic error
/// - invalidURL:       Invalid URL error
/// - invalidResponse:  Invalid reponse
enum ActorsStoreError: Error {
    
    case generic
    case invalidURL
    case invalidResponse
}


// MARK: - ActorsStoreProtocol

/// _ActorsStoreProtocol_ is a protocol for actor store behaviours
protocol ActorsStoreProtocol {
    
    /// Fetches actors from a store (API, memory, etc)
    ///
    /// - parameter query: The text entered by user for search
    /// - parameter page: Number of the page to retrieve, based on paging
    /// - parameter completion: The completion block
    func fetchActors(query: String?, page: Int, completion: @escaping (People?, Error?) -> ())
}
