//
//  ImageStoreProtocol.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit

protocol ImageStoreProtocol {
    
    /// Loads an image from the store given a URL
    ///
    /// - parameter url:        The URL of the image to load
    /// - parameter completion: The closure to trigger when the image loading completes
    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ())
}
