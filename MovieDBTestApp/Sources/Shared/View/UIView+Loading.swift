//
//  UIView+Loading.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/13/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit

extension UIView {
    
    func playLoadingAnimation() {
        
        let loader = UIActivityIndicatorView(frame: self.frame)
        loader.sizeThatFits(CGSize(width: 120, height: 120))
        loader.color = UIColor.gray
        self.addSubview(loader)
        let fadeLayer = CAShapeLayer()
        fadeLayer.frame = self.frame
        fadeLayer.fillColor = UIColor.black.cgColor
        fadeLayer.zPosition = -2
        loader.layer.addSublayer(fadeLayer)
        loader.startAnimating()
    }
    
    func stopLoadingAnimation() {
        if let item = self.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView{
            item.stopAnimating()
            item.removeFromSuperview()
        }
    }
}
