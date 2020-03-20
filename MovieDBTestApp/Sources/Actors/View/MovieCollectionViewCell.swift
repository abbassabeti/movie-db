//
//  MovieCollectionViewCell.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/13/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


final class MovieCollectionViewCell: BaseCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let itemView = MovieItemView()
    
    var viewModel: MovieViewModel? {
        
        didSet {
            
            itemView.viewModel = viewModel
        }
    }
    
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        
        clipsToBounds = true
        setupItemView()
    }
    
    private func setupItemView() {
        contentView.addSubview(itemView)
        contentView.backgroundColor = UIColor.red
        itemView.layer.masksToBounds = false
        /*NSLayoutConstraint(item: itemView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 50).isActive = true
         NSLayoutConstraint(item: itemView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 50).isActive = true
         NSLayoutConstraint(item: itemView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 50).isActive = true
         NSLayoutConstraint(item: itemView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 50).isActive = true*/
        itemView.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemView.layer.shadowColor = UIColor.black.cgColor
        itemView.layer.shadowOpacity = 0.73
        itemView.layer.shadowRadius = 5
    }
    
    
    // MARK: - Constraints
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        setupItemViewConstraints()
    }
    
    private func setupItemViewConstraints() {
        
        itemView.translatesAutoresizingMaskIntoConstraints = false
        
        itemView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        itemView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func prepareForReuse() {
        itemView.imageView.image = nil
    }
}
