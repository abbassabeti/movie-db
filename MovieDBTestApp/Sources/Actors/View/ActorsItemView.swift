//
//  ActorsItemView.swift
//  MovieDBTestApp
//
//  Created by user on 5/11/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieCollectionViewDelegate: class {
    func groupCarouselTableViewDidSelectItem(movie: MovieViewModel)
}

final class ActorsItemView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: MovieCollectionViewDelegate?
    
    var viewModel: ActorsViewModel? {
        
        didSet {
            titleLabel.text = viewModel?.title
            imageView.kf.setImage(with: viewModel?.profilePath)
            collectionView.reloadData()
            collectionView.contentOffset = CGPoint.zero
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
        let viewName = "ActorsItemView"
        let view = Bundle.main.loadNibNamed(viewName , owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension ActorsItemView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension ActorsItemView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (viewModel?.movies?.count ?? -1 > indexPath.row){
            
            if let movie = viewModel?.movies?[indexPath.row]{
                
                delegate?.groupCarouselTableViewDidSelectItem(movie: movie)
            }
        }
    }
    
}

extension ActorsItemView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.viewModel?.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        cell.itemView.viewModel = self.viewModel?.movies?[indexPath.row]
        return cell
    }
    
}
