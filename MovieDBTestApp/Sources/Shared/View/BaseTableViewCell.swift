//
//  BaseTableViewCell.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit

//MARK: - BaseTableViewCell

/// _BaseTableViewCell_ is a base view to implement abstract and common behaviour for table view cells
class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup
    
    open func setup() {
        
        // Abstract method.
    }
    
    // MARK: - Layout
    
    open func setupConstraints() {
        
        //Abstract method.
    }
    
    // MARK: - Reuse Identifier
    
    open class func reuseIdentifier() -> String {
        
        return NSStringFromClass(self)
    }
}
