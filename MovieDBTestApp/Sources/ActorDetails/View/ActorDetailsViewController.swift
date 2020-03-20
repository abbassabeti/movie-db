//
//  ActorDetailsViewController.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - ActorDetailsViewControllerInput

/// _ActorDetailsViewControllerInput_ is a protocol for view controller input behaviours
protocol ActorDetailsViewControllerInput: ActorDetailsPresenterOutput {
    
}


// MARK: - ActorDetailsViewControllerOutput

/// _ActorDetailsViewConrtollerOutput_ is a protocol for view controller output behaviours
protocol ActorDetailsViewControllerOutput {
    
    var movies: [Movie]? { get }
    
    
    /// Tells the output (interactor) to add actor to watch list
    ///
    /// - paramter actorId: The actor identifier
    func addToWatchList(actorId: Int)
    
    /// Tells the output (interactor) to remove actor from watch list
    ///
    /// - paramter actorId: The actor identifier
    func removeFromWatchList(actorId: Int)

}



// MARK: - ActorDetailsViewController

/// _ActorDetailsViewController_ is a view controller responsible for displaying actor details like a list of movies
final class ActorDetailsViewController: UIViewController, ErrorPresenter {
    
    var output: ActorDetailsViewControllerOutput!
    var router: ActorDetailsRouterProtocol!
    
    let actorDetailsView = ActorDetailsView(frame: UIScreen.main.bounds)
    
    fileprivate var actorViewModel: ActorDetailsViewModel? {
        didSet {
            
        }
    }
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _ActorDetailsViewController_ with actor and configurator
    ///
    /// - parameter actor:          The actor
    /// - parameter configurator:   The configurator
    ///
    /// - returns: The instance of _ActorDetailsViewController_
    init(actor: ActorsViewModel, configurator: ActorDetailsConfigurator = ActorDetailsConfigurator.sharedInstance) {
        
        self.actorViewModel = ActorDetailsViewModel(id: actor.id,name: actor.title, profilePath: actor.profilePath, movies: actor.movies,popularity: actor.popularity)
        
        super.init(nibName: nil, bundle: nil)
        
        configure(configurator: configurator)
    }
    
    /// Initializes an instance of _ActorDetailsViewController_ from nib
    ///
    /// - parameter coder: The coder
    ///
    /// returns: The instance of _ActorDetailsViewController_
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configurator
    
    private func configure(configurator: ActorDetailsConfigurator = ActorDetailsConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    
    // MARK: - View lifecycle
    
    override func loadView() {
        
        view = actorDetailsView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitle()
        setupTableView()
        fillViews()
    }
    
    private func fillViews() {
        actorDetailsView.imageView.setImageURL(url: actorViewModel?.profilePath){[weak self] url, image in
            
            let fetchedUrl = url?.absoluteString
            let modelUrl = self?.actorViewModel?.profilePath?.absoluteString
            if (fetchedUrl == modelUrl){
                self?.actorDetailsView.imageView?.image = image
            }
        }
        actorDetailsView.popularity.text = actorViewModel?.popularity != nil ? "\(Int((actorViewModel?.popularity)!)) %" : "-"
        actorDetailsView.tableView.reloadData()
    }
    
    
    // MARK: - Setup
    
    private func setupTitle() {
        
        if let actorName = actorViewModel?.name {
            
            title = actorName
            
        } else {
            
            title = Strings.Actors.screenTitle
            
        }
    }
    
    private func setupTableView() {
        actorDetailsView.tableView.estimatedRowHeight = 220
        actorDetailsView.tableView.delegate = self
        actorDetailsView.tableView.dataSource = self
        actorDetailsView.tableView.register(ActorDetailsTableViewCell.self, forCellReuseIdentifier:ActorDetailsTableViewCell.reuseIdentifier())
        actorDetailsView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    
    // MARK: - Event handling
    
    /// Asks the output to add to the watchList
    func addToWatchList() {
        
        if let actorId = actorViewModel?.id {
            
            output.addToWatchList(actorId: actorId)
        }
    }
    
    /// Asks the output to add to the watchList
    func removeFromWatchList() {
        
        if let actorId = actorViewModel?.id {
            output.removeFromWatchList(actorId: actorId)
        }
    }
    
    /// Asks the output to fetch movies. Called when there is a need to refresh the movie list
    @objc func refresh() {
        //Should be implemented to add refresh to actor details view controller
    }
}


// MARK: - UITableViewDataSource

extension ActorDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 230
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorViewModel?.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActorDetailsTableViewCell.reuseIdentifier(), for: indexPath) as? ActorDetailsTableViewCell else {
            
            assert(false, "Invalid table view cell. Did you forget to register ActorDetailsTableViewCell?")
            
            return UITableViewCell()
        }
        
        let movie = actorViewModel?.movies?[indexPath.row]
        
        let title = movie?.title ?? movie?.original_name ?? "----"
        
        cell.viewModel = MovieViewModel(title : title, backdropPath: movie?.backdropPath, vote_average: movie?.vote_average, vote_count: movie?.vote_count, overview: movie?.overview, release_date: movie?.release_date,id: movie?.id, original_name: movie?.original_name)
        
        return cell
    }
}


// MARK: - UITableViewDelegate

extension ActorDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let movies = actorViewModel?.movies , movies.count > indexPath.row {
            
            let movie = movies[indexPath.row]
            router.navigateToMovieDetails(movie: movie)
        }
    }
}


// MARK: - ActorDetailsPresenterOutput

extension ActorDetailsViewController: ActorDetailsViewControllerInput {
    func displayMovie(viewModel: MovieViewModel) {
        
    }
    
    func displayError(viewModel: ErrorViewModel) {
        actorDetailsView.refreshControl.endRefreshing()
        self.presentError(viewModel: viewModel)
    }
}
