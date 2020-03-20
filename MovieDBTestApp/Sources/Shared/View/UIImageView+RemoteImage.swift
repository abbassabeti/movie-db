//
//  UIImageView+RemoteImage.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - UIImageView

extension UIImageView {
    
    func setImageURL(url: URL?, placeholder: UIImage? = nil, completion: @escaping (URL?,UIImage?) -> ()) {
        guard let imageURL = url else {
            image = placeholder
            return
        }
        
        ImageManager.sharedInstance.loadImage(url: imageURL) { /*[weak self]*/ image, error in
            //if let strongSelf = self {
                completion(url, image)
                //strongSelf.image = image
            //}
        }
    }
}
