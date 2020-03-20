//
//  MovieItemView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - ActorDetailsItemView

/// _ActorDetailsItemView_ is a view responsible for the display of details of actor's movie (movie)
final class ActorDetailsItemView: UIView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: MovieViewModel? {
        
        didSet {
            
            titleLabel.text = viewModel?.title
            imgView.setImageURL(url: viewModel?.backdropPath){[weak self] url, image in
                DispatchQueue.main.async {
                    let fetchedUrl = url?.absoluteString
                    let modelUrl = self?.viewModel?.backdropPath?.absoluteString
                    if (fetchedUrl == modelUrl){
                        self?.imgView.image = image
                    }
                }
            }
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

