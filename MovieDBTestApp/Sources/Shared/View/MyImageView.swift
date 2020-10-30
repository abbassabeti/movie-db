//
//  MyImageView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 10/30/20.
//  Copyright © 2020 Abbas. All rights reserved.
//

import UIKit

@IBDesignable
class MyImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var topRadius : CGFloat = 0 {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var bottomRadius : CGFloat = 0 {
        didSet{
            setupView()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    override func layoutSubviews() {
        setupView()
        super.layoutSubviews()
    }
    
    func setupView(){
        if (self.topRadius > 0 || self.bottomRadius > 0){
            self.roundCorners(topLeft: self.topRadius, topRight: self.topRadius, bottomLeft: self.bottomRadius, bottomRight: self.bottomRadius)
            return
        }
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}
