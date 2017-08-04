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
        movieRatingLabel.text = howManyStars(rating: movie.voteAverage)
        movieSummaryLabel.text = movie.overview

        // FIXME: need code to call a image up
        MovieController.grabMoviePosterFor(movie: movie) { (image) in
            DispatchQueue.main.async {
                self.movieImageView.image = image
            }
        }
    }
    
    func howManyStars(rating: Double) -> String {
        let intRating = Int(round(rating))
        
        switch intRating {
        case 1:
            return "⭐️"
        case 2:
            return "⭐️⭐️"
        case 3:
            return "⭐️⭐️⭐️"
        case 4:
            return "⭐️⭐️⭐️⭐️"
        case 5:
            return "⭐️⭐️⭐️⭐️⭐️"
        case 6:
            return "⭐️⭐️⭐️⭐️⭐️⭐️"
        case 7:
            return "⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        case 8:
            return "⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        case 9:
            return "⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        case 10:
            return "⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        default:
            return ""
        }
    }
}
