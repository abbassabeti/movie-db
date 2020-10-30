//
//  ActorDetailsView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit

// MARK: - ActorDetailsView

/// _ActorDetailsView_ is the main view for _ActorDetailsViewController_
final class ActorDetailsView: UIView {
    
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    let refreshControl = UIRefreshControl()
    
    private struct Constants {
        
        static let rowHeight: CGFloat = 200.0
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
        let viewName = "ActorDetailsView"
        let view = Bundle.main.loadNibNamed(viewName , owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        setupBackground()
        setupTableView()
    }
    
    private func setupBackground() {
        
        backgroundColor = UIColor.white
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.lightGray
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.showsVerticalScrollIndicator = false
    }
    
    
    // MARK: Layout
    
    private func setupConstraints() {
        
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}
