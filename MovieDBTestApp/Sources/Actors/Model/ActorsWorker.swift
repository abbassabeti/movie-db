//
//  ActorsWorker.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - ActorsWorker

/// _ActorsWorker_ is a worker object responsible to fetch actors from a store
class ActorsWorker {
    
    fileprivate var store: ActorsStoreProtocol
    
    
    // MARK: - Initializers
    
    /// Initializes an _ActorsWorker_ with a store
    ///
    /// - parameter store: A store where to fetch actors from (API, memory, etc)
    ///
    /// - returns: The instance of _ArtistsWorker_
    init(store: ActorsStoreProtocol = ActorsAPIStore()) {
        
        self.store = store
    }
    
    
    // MARK: - Business Logic
    
    /// Fetches actors from a store
    ///
    /// - parameter completion: The completion block
    func fetchActors(query: String?,page: Int, completion: @escaping (People?, Error?) -> ()) {
        
        store.fetchActors(query: query, page: page, completion: completion)
    }
}
