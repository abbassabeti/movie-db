//
//  MovieDetailsViewController.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit
import Kingfisher


// MARK: - MovieDetailsViewControllerInput

/// _MovieDetailsViewControllerInput_ is a protocol for view controller input behaviours
protocol MovieDetailsViewControllerInput: MovieDetailsPresenterOutput {
    
}


// MARK: - MovieDetailsViewControllerOutput

/// _MovieDetailsViewConrtollerOutput_ is a protocol for view controller output behaviours
protocol MovieDetailsViewControllerOutput {
    
    var movies: [Movie]? { get }
    
    
    /// Tells the output (interactor) to add movie to watch list
    ///
    /// - paramter movieId: The movie identifier
    func addToWatchList(movieId: Int)
    
    /// Tells the output (interactor) to remove movie from watch list
    ///
    /// - paramter movieId: The movie identifier
    func removeFromWatchList(movieId: Int)
    
}



// MARK: - MovieDetailsViewController

/// _MovieDetailsViewController_ is a view controller responsible for displaying movie details
final class MovieDetailsViewController: UIViewController, ErrorPresenter {
    
    var output: MovieDetailsViewControllerOutput!
    var router: MovieDetailsRouterProtocol!
    
    let movieDetailsView = MovieDetailsView(frame: UIScreen.main.bounds)
    
    fileprivate var movieViewModel: MovieViewModel? {
        didSet {
            updateWithViewModel()
        }
    }
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _MovieDetailsViewController_ with movie and configurator
    ///
    /// - parameter movie:          The movieViewModel
    /// - parameter configurator:   The configurator
    ///
    /// - returns: The instance of _MovieDetailsViewController_
    init(movie: MovieViewModel, configurator: MovieDetailsConfigurator = MovieDetailsConfigurator.sharedInstance) {
        
        super.init(nibName: nil, bundle: nil)
        self.movieViewModel = movie
        self.updateWithViewModel()
        configure(configurator: configurator)
    }
    
    /// Initializes an instance of _MovieDetailsViewController_ from nib
    ///
    /// - parameter coder: The coder
    ///
    /// returns: The instance of _MovieDetailsViewController_
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configurator
    
    private func configure(configurator: MovieDetailsConfigurator = MovieDetailsConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    
    // MARK: - View lifecycle
    
    override func loadView() {
        
        view = movieDetailsView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitle()
    }
    
    private func updateWithViewModel(){
        movieDetailsView.delegate = self
        movieDetailsView.imageView.kf.setImage(with: movieViewModel?.backdropPath)
        movieDetailsView.titleLabel.text = movieViewModel?.title
        movieDetailsView.descriptionLabel.text = movieViewModel?.overview
        movieDetailsView.dateLabel.text = movieViewModel?.releaseDate
        syncWatchList()
    }
    
    private func syncWatchList(){
        if let movie = movieViewModel {
            if WatchlistWorker.sharedInstance.hasMovie(movie: movie) {
                movieDetailsView.darkenWatchButton()
            }else{
                movieDetailsView.lightenWatchButton()
            }
        }
    }

    
    
    // MARK: - Setup
    
    private func setupTitle() {
        
        if let movieName = movieViewModel?.title {
            
            title = movieName
            
        } else {
            
            title = Strings.Actors.screenTitle
            
        }
    }
    
    
    // MARK: - Event handling
    
    /// Asks the output to add to the watchList
    func addToWatchList() {
        
        if let movieId = movieViewModel?.id {
            
            output.addToWatchList(movieId: movieId)
            syncWatchList()
        }
    }
    
    /// Asks the output to add to the watchList
    func removeFromWatchList() {
        
        if let movieId = movieViewModel?.id{
            output.removeFromWatchList(movieId: movieId)
            syncWatchList()
        }
    }
    
    /// Asks the output to fetch movies. Called when there is a need to refresh the movie list
    @objc func refresh() {
        //Should be implemented to add refresh to movie details view controller
    }
    
    func checkWatchlistState() {
        if let viewModel = movieViewModel {
            if WatchlistWorker.sharedInstance.hasMovie(movie: viewModel) {
                movieDetailsView.darkenWatchButton()
            }else{
                movieDetailsView.lightenWatchButton()
            }
        }
    }
}

extension MovieDetailsViewController : MovieDetailsViewDelegate {
    func toggleWatchLater(){
        if let viewModel = movieViewModel {
            if WatchlistWorker.sharedInstance.toggleMovie(movie: viewModel) {
                checkWatchlistState()
            }
        }
    }
}


// MARK: - MovieDetailsPresenterOutput

extension MovieDetailsViewController: MovieDetailsViewControllerInput {
    func displayMovie(viewModels: [MovieViewModel]) {
    }
    
    func displayError(viewModel: ErrorViewModel) {
    }
}

