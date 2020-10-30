//
//  ActorDetailsTableViewCell.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - ActorDetailsTableViewCell

/// _ActorDetailsTableViewCell_ is the table view cell responsible to display a movie
final class ActorDetailsTableViewCell: BaseTableViewCell {
    
    override class func reuseIdentifier() -> String {
        return "actor_details"
    }
    
    var itemView : ActorDetailsItemView!
    
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
        guard let itemView = UINib(nibName: "ActorDetailsItemView", bundle: nil).instantiate(withOwner: self, options: nil).first as? ActorDetailsItemView else {return}
            //ActorDetailsItemView(frame: contentView.frame)
        self.itemView = itemView
        contentView.addSubview(itemView)
    }
    
    // MARK: - Constraints
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        setupItemViewConstraints()
    }
    
    private func setupItemViewConstraints() {
        itemView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
        ])
    }
    
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        viewModel = nil
    }
}
