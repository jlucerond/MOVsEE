//
//  Movie.swift
//  MOVsEE
//
//  Created by Joe Lucero on 8/4/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import Foundation

class Movie {
    private let titleKey = "title"
    private let voteAverageKey = "vote_average"
    private let overviewKey = "overview"
    private let posterPathKey = "poster_path"
    private let releaseDateKey = "release_date"
    
    let title: String
    let voteAverage: Double
    let overview: String
    let posterPath: String
    let releaseDate: String
    
    init?(dictionary: [String : Any]) {
        guard let title = dictionary[titleKey] as? String,
            let voteAverage = dictionary[voteAverageKey] as? Double,
            let overview = dictionary[overviewKey] as? String,
            let posterPath = dictionary[posterPathKey] as? String,
            let releaseDate = dictionary[releaseDateKey] as? String else { return nil }
        
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
    }
}

extension Movie: CustomStringConvertible {
    
    var description: String {
        return "Movie: \(title)"
    }
}
