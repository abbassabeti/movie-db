//
//  WatchListView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit

// MARK: - WatchListView

/// _WatchListView_ is the main view for _WatchListViewController_
final class WatchListView: UIView {

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
        let viewName = "WatchListView"
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
        
        tableView.rowHeight = Constants.rowHeight
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.lightGray
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.showsVerticalScrollIndicator = false
        tableView.insertSubview(refreshControl, at: 0)
    }
    
    
    // MARK: Layout
    
    private func setupConstraints() {
        
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

