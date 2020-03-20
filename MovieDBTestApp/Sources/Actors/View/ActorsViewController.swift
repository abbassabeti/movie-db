//
//  ActorsViewController.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - ActorsViewControllerInput

/// _ActorsViewControllerInput_ is a protocol for view controller input behaviours
protocol ActorsViewControllersInput : ActorsPresenterOutput {
    
}


// MARK: - ActorsViewControllerOutput

/// _ActorsViewControllerInput_ is a protocol for view controller output behaviours
protocol ActorsViewControllerOutput {
    
    var people: People? { get }
    
    ///Tells the output (interactor) to fetch top actors
    func fetchActors(query: String?, page: Int)
}


// MARK: - ActorsViewController

/// _ActorsViewController_ is a view conrtoller responsible for displaying a list of top actors
final class ActorsViewController: UIViewController, ErrorPresenter {
    
    var output: ActorsViewControllerOutput!
    var router: ActorsRouterProtocol!
    
    let actorsView = ActorsView(frame: UIScreen.main.bounds)
    var page = 1
    fileprivate var actorsViewModels: [ActorsViewModel] = []
    
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _ActorsViewController_ with a configurator
    ///
    /// - parameter configurator: The configurator
    ///
    /// - returns: The instance of _ActorsViewController_
    init(configurator: ActorsConfigurator = ActorsConfigurator.sharedInstance) {
        super.init(nibName: nil, bundle: nil)
        configure(configurator: configurator)
    }
    
    /// Initializes an instance of _ActorsViewController_ from nib
    ///
    /// - parameter coder: The coder
    ///
    /// - returns : The instance of _ActorsViewController_
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //configure(configurator: ActorsConfigurator.sharedInstance)
    }
    
    
    // MARK: - Configurator
    
    private func configure(configurator: ActorsConfigurator = ActorsConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    // MARK: - View lifecycle
    
    override func loadView() {
        view = actorsView
        actorsView.delegate = self
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTitle()
        setupTableView()
        let query = actorsView.searchField.text
        fetchActors(query: query ,page: 1)
    }
    
    
    // MARK: - Setup
    
    private func setupTitle() {
        
        title = Strings.Actors.screenTitle
    }
    
    private func setupTableView() {
        
        actorsView.tableView.delegate = self
        actorsView.tableView.dataSource = self
        actorsView.tableView.register(ActorsTableViewCell.self, forCellReuseIdentifier: ActorsTableViewCell.reuseIdentifier())
        actorsView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        actorsView.searchField.addTarget(self, action: #selector(refreshWithText(_:)), for: .editingChanged)

    }
    
    
    // MARK: - Event handling
    
    ///Asks the output to fetch actors
    func fetchActors(query: String?, page: Int) {
        actorsView.playLoadingAnimation()
        output.fetchActors(query: query, page: page)
    }
    
    /// Asks the output to fetch actors. Called when there is a need to refresh the actors list
    @objc func refresh() {
        let query = actorsView.searchField.text
        actorsView.tableView.contentOffset = CGPoint.zero
        actorsViewModels = []
        fetchActors(query: query, page: 1)
    }
    
    @objc func refreshWithText(_ textField: UITextField) {
        let query = textField.text
        actorsView.tableView.contentOffset = CGPoint.zero
        fetchActors(query: query, page: 1)
    }
}


extension ActorsViewController : ActorsViewProtocol {
    func watchLaterDidTapped() {
        let movies = WatchlistWorker.sharedInstance.loadMovies() ?? []
        router.navigateToWatchLater(movies: movies)
    }
    
    
}


// MARK: - UITableViewDataSource

extension ActorsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsViewModels.count
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == actorsViewModels.count - 1 && (page * 20 - 1) == indexPath.row ) {
            page += 1
            let query = actorsView.searchField.text
            fetchActors(query: query, page: page)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActorsTableViewCell.reuseIdentifier(), for: indexPath) as? ActorsTableViewCell else {
            
            assert(false, "Invalid table view cell. Did you forget to register ActorTableViewCell?")
            
            return UITableViewCell()
        }
        
        let viewModel = actorsViewModels[indexPath.row]
        cell.viewModel = viewModel
        cell.delegate = self
        
        return cell
    }
}

extension ActorsViewController: ActorsTableViewCellDelegate {
    
    func needsToShowAMovieDetails(movie: MovieViewModel) {
        
        router.navigateToMovieDetails(selectedMovie: movie)
    }
}


// MARK: - UITableViewDelegate

extension ActorsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (actorsViewModels.count > indexPath.row){
            let actor = actorsViewModels[indexPath.row]
            router.navigateToActorDetails(selectedActor: actor)
        }
    }
}


// MARK: ActorsPresenterOutput

extension ActorsViewController: ActorsViewControllersInput {
    
    func displayActors(viewModels: [ActorsViewModel]) {
        actorsViewModels.append(contentsOf: viewModels)
        actorsView.tableView.reloadData()
        actorsView.refreshControl.endRefreshing()
        actorsView.stopLoadingAnimation()
    }
    
    func displayError(viewModel: ErrorViewModel) {
        presentError(viewModel: viewModel)
        actorsView.refreshControl.endRefreshing()
        actorsView.stopLoadingAnimation()
    }
}
