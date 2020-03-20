//
//  ActorsItemView.swift
//  MovieDBTestApp
//
//  Created by user on 5/11/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit

final class MovieItemView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var viewModel: MovieViewModel? {
        
        didSet {
            let title = (viewModel?.title != "") ? viewModel?.title : viewModel?.original_name
            titleLabel.text = title
            imageView.setImageURL(url: viewModel?.backdropPath) {[weak self] url, image in
                
                let fetchedUrl = url?.absoluteString
                let modelUrl = self?.viewModel?.backdropPath?.absoluteString
                if (fetchedUrl == modelUrl){
                    self?.imageView.image = image
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
        let viewName = "MovieItemView"
        let view = Bundle.main.loadNibNamed(viewName , owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
}
