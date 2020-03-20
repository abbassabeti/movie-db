//
//  ActorDetailsTableViewCell.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation


// MARK: - ActorDetailsTableViewCell

/// _ActorDetailsTableViewCell_ is the table view cell responsible to display a movie
final class ActorDetailsTableViewCell: BaseTableViewCell {
    
    let itemView = ActorDetailsItemView()
    
    var viewModel: MovieViewModel? {
        
        didSet {
            
            itemView.viewModel = viewModel
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
        itemView.frame = self.bounds
    }
    
    // MARK: - Constraints
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        setupItemViewConstraints()
    }
    
    private func setupItemViewConstraints() {
        
        /*itemView.translatesAutoresizingMaskIntoConstraints = false
        
        itemView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemView.leadingAnchor*/
    }
    
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        viewModel = nil
    }
}
