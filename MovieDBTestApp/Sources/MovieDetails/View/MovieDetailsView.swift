//
//  MovieDetailsView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit

protocol MovieDetailsViewDelegate: class {
    func toggleWatchLater()
}


// MARK: - MovieDetailsView

/// _MovieDetailsView_ is the main view for _MovieDetailsViewController_
final class MovieDetailsView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var watchLater: UIButton!
    
    weak var delegate: MovieDetailsViewDelegate?
    
    
    private struct Constants {
        
        static let rowHeight: CGFloat = 260.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func watchLaterBtnDidTapped(_ sender: Any) {
        delegate?.toggleWatchLater()
    }
    
    func darkenWatchButton(){
        watchLater.alpha = 1
    }
    
    func lightenWatchButton(){
        watchLater.alpha = 0.3
    }
    
    
    // MARK: - Setup
    
    func setup() {
        let viewName = "MovieDetailsView"
        let view = Bundle.main.loadNibNamed(viewName , owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        setupBackground()
        setupWatchButton()
    }
    
    private func setupBackground() {
        
        backgroundColor = UIColor.white
    }
    
    private func setupWatchButton() {
        watchLater.layer.cornerRadius = 4
    }
    
    
    // MARK: Layout
    
    private func setupConstraints() {
        
    }
    
}

