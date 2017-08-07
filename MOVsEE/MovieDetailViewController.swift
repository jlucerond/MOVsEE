//
//  MovieDetailViewController.swift
//  MOVsEE
//
//  Created by Joe Lucero on 8/4/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    
    var movie: Movie? {
        didSet {
            if self.isViewLoaded { updateViews() }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        
        self.title = movie.title
        self.ratingLabel.text = MovieController.howManyStars(rating: movie.voteAverage)
        self.summaryLabel.text = movie.overview
        self.releaseDateLabel.text = movie.releaseDate
        
        MovieController.grabMoviePosterFor(movie: movie,
                                           sizeOfPoster: .large) { (image) in
                                            DispatchQueue.main.async {
                                                self.moviePosterImageView.image = image
                                            }
        }
    }

}
