//
//  ActorsTableViewCell.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


protocol ActorsTableViewCellDelegate: class {
    func needsToShowAMovieDetails(movie: MovieViewModel)
}

// MARK: -  ArtistTableViewCell

/// _ArtistTableViewCell_ is the table view cell responsible to display an artist
final class ActorsTableViewCell: BaseTableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    weak var delegate: ActorsTableViewCellDelegate?
    
    let itemView = ActorsItemView()
    
    var viewModel: ActorsViewModel? {
        
        didSet {
            
            itemView.viewModel = viewModel
            itemView.delegate = self
        }
    }
    
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        
        clipsToBounds = true
        selectionStyle = .none
        
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
        itemView.layer.shadowOffset = CGSize(width: 20, height: 20)
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
    
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        viewModel = nil
    }
}

extension ActorsTableViewCell : MovieCollectionViewDelegate {
    func groupCarouselTableViewDidSelectItem(movie: MovieViewModel) {
        delegate?.needsToShowAMovieDetails(movie: movie)
    }
}
