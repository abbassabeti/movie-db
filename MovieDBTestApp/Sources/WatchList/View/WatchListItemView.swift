//
//  WatchListItemView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit
import Kingfisher


// MARK: - WatchListItemView

/// _WatchListItemView_ is a view responsible for the display list of favorite movies
final class WatchListItemView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var viewModel: MovieViewModel? {
        
        didSet {
            
            titleLabel.text = viewModel?.title
            imageView.kf.setImage(with: viewModel?.backdropPath)
            imageView.contentMode = .scaleAspectFit
        }
    }
    
    private struct Constants {
        
        static let imageSize = CGSize(width: 50.0, height: 50.0)
        
        struct Margin {
            
            static let left: CGFloat = 10.0
            static let right: CGFloat = 10.0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setup() {
        let viewName = "WatchListItemView"
        let view = Bundle.main.loadNibNamed(viewName , owner: self, options: nil)![0] as! UIView
        setupView(view: view)
    }
    
    func setupView(view: UIView){
        self.addSubview(view)
        let topContraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 0)
        let bottomContraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: 0)
        let rightContraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 0)
        let leftContraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 0)
        self.addConstraint(topContraint)
        self.addConstraint(bottomContraint)
        self.addConstraint(rightContraint)
        self.addConstraint(leftContraint)
        
    }
}


