//
//  WatchListTableViewCell.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - WatchListTableViewCell

/// _WatchListTableViewCell_ is the table view cell responsible to display a movie
final class WatchListTableViewCell: BaseTableViewCell {
    
    let itemView = WatchListItemView()
    
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

