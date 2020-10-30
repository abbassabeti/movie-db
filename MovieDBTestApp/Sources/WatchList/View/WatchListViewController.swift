//
//  WatchListViewController.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/14/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


//
//  WatchListViewController.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - WatchListViewControllerInput

/// _WatchListViewControllerInput_ is a protocol for view controller input behaviours
protocol WatchListViewControllerInput: WatchListPresenterOutput {
    
}


// MARK: - WatchListViewControllerOutput

/// _WatchListViewControllerOutput_ is a protocol for view controller output behaviours
protocol WatchListViewControllerOutput {
}



// MARK: - WatchListViewController

/// _WatchListViewController_ is a view controller responsible for displaying favorite movies like a list
final class WatchListViewController: UIViewController, ErrorPresenter {
    
    var output: WatchListViewControllerOutput!
    var router: WatchListRouterProtocol!
    
    let watchListView = WatchListView(frame: UIScreen.main.bounds)
    
    fileprivate var movieViewModel: [MovieViewModel]? {
        didSet {
            self.watchListView.tableView.reloadData()
        }
    }
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _WatchListViewController_ with movies and configurator
    ///
    /// - parameter movies:          The list of movies
    /// - parameter configurator:   The configurator
    ///
    /// - returns: The instance of _WatchListViewController_
    init(movies: [MovieViewModel], configurator: WatchListConfigurator = WatchListConfigurator.sharedInstance) {
        
        self.movieViewModel = movies
        
        super.init(nibName: nil, bundle: nil)
        
        configure(configurator: configurator)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: Notification.Name.favoriteUpdated, object: nil)

    }
    
    
    
    /// Initializes an instance of _WatchListViewController_ from nib
    ///
    /// - parameter coder: The coder
    ///
    /// returns: The instance of _WatchListViewController_
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configurator
    
    private func configure(configurator: WatchListConfigurator = WatchListConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    
    // MARK: - View lifecycle
    
    override func loadView() {
        
        view = watchListView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitle()
        setupTableView()
        fillViews()
    }
    
    private func fillViews() {
        watchListView.tableView.reloadData()
    }
    
    
    // MARK: - Setup
    
    private func setupTitle() {
            
        title = Strings.Actors.favoriteMovies

    }
    
    private func setupTableView() {
        
        watchListView.tableView.delegate = self
        watchListView.tableView.dataSource = self
        watchListView.tableView.register(WatchListTableViewCell.self, forCellReuseIdentifier:WatchListTableViewCell.reuseIdentifier())
        watchListView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    
    // MARK: - Event handling
    
    /// Asks the output to fetch movies. Called when there is a need to refresh the movie list
    @objc func refresh() {
        movieViewModel = WatchlistWorker.sharedInstance.getCurrentMovies()
    }
}


// MARK: - UITableViewDataSource

extension WatchListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WatchListTableViewCell.reuseIdentifier(), for: indexPath) as? WatchListTableViewCell else {
            
            assert(false, "Invalid table view cell. Did you forget to register WatchListTableViewCell?")
            
            return UITableViewCell()
        }
        
        let movie = movieViewModel?[indexPath.row]
        cell.viewModel = movie
        
        return cell
    }
}


// MARK: - UITableViewDelegate

extension WatchListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let movies = movieViewModel , movies.count > indexPath.row {
            
            let movie = movies[indexPath.row]
            router.navigateToMovieDetails(movie: movie)
        }
    }
}


// MARK: - WatchListPresenterOutput

extension WatchListViewController: WatchListViewControllerInput {
    func displayError(viewModel: ErrorViewModel) {
        
    }
    
    
    func displayMovies(viewModel: [MovieViewModel]) {
        
    }
}
