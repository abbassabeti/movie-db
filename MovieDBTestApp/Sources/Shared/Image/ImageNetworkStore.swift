//
//  ImageNetworkStore.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit

class ImageNetworkStore: ImageStoreProtocol {
    
    /// Download an image given a URL
    ///
    /// - parameter url:        The image URL
    /// - parameter completion: The closure to trigger when the download completes
    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        let request = URLRequest(url: url)

        NetworkClient.sharedInstance.sendRequest(request: request) { data, response, error in
            
            if let imageData = data, let image = UIImage(data: imageData) {
                
                if let responseURL = response?.url, responseURL == url {
                    
                    completion(image, nil)
                }
                
            } else {
                
                completion(nil, nil)
            }
        }
    }
}
