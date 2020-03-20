//
//  ActorsView.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit

protocol ActorsViewProtocol : class {
    func watchLaterDidTapped()
}

// MARK: - ActorsView

/// _ActorsView_ is the main view for _ActorsViewController_
final class ActorsView: UIView {
    
    @IBOutlet weak var watchLater: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    let refreshControl = UIRefreshControl()
    
    private struct Constants {
        
        static let rowHeight: CGFloat = 240
    }
    
    weak var delegate: ActorsViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func watchLaterDidTapped(_ sender: Any) {
        delegate?.watchLaterDidTapped()
    }
    
    
    // MARK: - Setup
    
    func setup() {
        let viewName = "ActorsView"
        let view = Bundle.main.loadNibNamed(viewName , owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        setupTableView()
        setupConstraints()
        setupTextField()
    }
    
    private func setupTableView() {
        
        tableView.rowHeight = Constants.rowHeight
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.white
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.showsVerticalScrollIndicator = true
        tableView.insertSubview(refreshControl, at: 0)
    }
    
    
    // MARK: - Layout
    
    func setupConstraints() {
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTextField(){
        searchField.layer.borderWidth = 1
        searchField.layer.borderColor = UIColor.gray.cgColor
        searchField.layer.cornerRadius = 4
        searchField.placeholder = "Search here..."
    }
}
