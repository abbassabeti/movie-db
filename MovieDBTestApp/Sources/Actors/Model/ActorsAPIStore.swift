//
//  ActorsAPIStore.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - ActorsAPIStore

/// _ActorsAPIStore_ is a class responsible for fetching actors
final class ActorsAPIStore {
    
    fileprivate struct Constants {
        static let topActorsLimit = 50
        static let topActorsDictionaryKey = "results"
        static let topActorsArrayKey = "actor"
    }
    
    fileprivate let networkClient: NetworkClientProtocol
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _ActorsAPIStore_ with an object that conforms to the protocol _NetworkClientProtocol
    ///
    /// - parameter networkClient: The object to be used to send requests to the API
    ///
    /// - returns: The instance of _ActorsAPIStore_
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
        
        self.networkClient = networkClient
    }
}


// MARK: - ActorsStoreProtocol

extension ActorsAPIStore: ActorsStoreProtocol {
    
    /// Fetches a list of top actors
    ///
    /// - parameter query: The text entered by user for search
    /// - parameter page: The page number of actors to fetch
    /// - parameter completion: The completion block
    func fetchActors(query: String?,page: Int, completion: @escaping (People?, Error?) -> ()) {
        
        let limit = Constants.topActorsLimit
        guard let url = MovieDBAPIEndPoint.getTopActors(query, page).url() else {
            
            completion (nil, ActorsStoreError.invalidURL)
            
            return
        }
        let request = URLRequest.jsonRequest(url: url)
        networkClient.sendRequest(request: request) { data, response, error in
            do {
                
                var peopleOutput : People?
                var errorOutput: Error?
                guard let data = data else {
                    if let err = error {
                        
                        errorOutput = error
                        
                    }else {
                        
                        errorOutput = ActorsStoreError.invalidResponse
                        
                    }
                    completion(nil, errorOutput)
                    return
                }
                print(String(data: data, encoding: String.Encoding.utf8))
                let people = try JSONDecoder().decode(People.self, from: data)
                    
                peopleOutput = people
                
                completion(peopleOutput, errorOutput)
                
            }catch let error {
                
                completion(nil, error)
            }
        }
    }
}
