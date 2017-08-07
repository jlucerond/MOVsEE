//
//  MovieTableViewCell.swift
//  MOVsEE
//
//  Created by Joe Lucero on 8/4/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!

    func updateViewsFor(movie: Movie) {
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = MovieController.howManyStars(rating: movie.voteAverage)
        movieSummaryLabel.text = movie.overview

        MovieController.grabMoviePosterFor(movie: movie, sizeOfPoster: .small) { (image) in
            DispatchQueue.main.async {
                self.movieImageView.image = image
            }
        }
    }
}
