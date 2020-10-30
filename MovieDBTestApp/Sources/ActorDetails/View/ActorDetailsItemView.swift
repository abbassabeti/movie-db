//
//  MovieItemView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit
import Kingfisher


// MARK: - ActorDetailsItemView

/// _ActorDetailsItemView_ is a view responsible for the display of details of actor's movie (movie)
final class ActorDetailsItemView: UIView {
    
    @IBOutlet weak var imgView: MyImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: MovieViewModel? {
        
        didSet {
            titleLabel.text = viewModel?.title
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.kf.setImage(with: viewModel?.backdropPath)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.awakeFromNib()
    }
    
    // MARK: - Setup
    
    func setup() {
        let viewName = "ActorDetailsItemView"
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

