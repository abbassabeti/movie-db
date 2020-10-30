//
//  ImageManager.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit

class ImageManager {
    
    static let sharedInstance = ImageManager()
    
    private let memoryStore = ImageMemoryStore()
    private let networkStore = ImageNetworkStore()
    
    var updateNetworkStatusActivityIndicator: Bool = true
    
    /// Loads an image from memory cache or the network if not cached
    ///
    /// - parameter url:        The image URL
    /// - parameter completion: The closure to trigger when the image has been loaded
    func loadImage(url: URL, completion: @escaping (UIImage?,Error?) -> ()) {
        
        memoryStore.loadImage(url: url) { [weak self] cachedImage, memoryStoreError in
            if let strongSelf = self {
                
                if let _ = cachedImage {
                    
                    completion(cachedImage, nil)
                    
                } else {
                    
                    strongSelf.setNetworkActivityIndicatorVisible(visible: true)
                    strongSelf.networkStore.loadImage(url: url, completion: { downloadedImage, networkStoreError in
                        
                        strongSelf.setNetworkActivityIndicatorVisible(visible: false)
                        /// I wrote a memory store to do caching on images. But it seems to need some serious memory management more than the threshold I've already defined. For now, I disabled it to concentrate on main tasks.
                                            
                        completion(downloadedImage, networkStoreError)
                    })
                }
            }
            
        }
    }
    
    /// Clears all images from all caches
    func clearCache() {
        
        memoryStore.removeAllImages()
    }
    
    
    // MARK: - Private
    
    private func setNetworkActivityIndicatorVisible(visible: Bool) {
        
        if updateNetworkStatusActivityIndicator {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = visible
        }
    }
    
}
