//
//  MovieController.swift
//  MOVsEE
//
//  Created by Joe Lucero on 8/4/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class MovieController {
    
    enum MoviePosterSize: String {
        case small = "w154"
        case large = "w300"
    }
    
    private static let myAPIValue = "241e7cdd9c39c228149aecefa596fdbb"
    private static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    private static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/")
    private static let apiKey = "api_key"
    private static let nameKey = "query"
    
    static func grabAllMoviesWith(usersSearchTerm search: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let baseURL = baseURL else { completion([]) ; return }
        
        guard var urlWithComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else { completion([]) ; return }
        let apiQuery = URLQueryItem(name: apiKey, value: myAPIValue)
        let searchQuery = URLQueryItem(name: nameKey, value: search)
        
        urlWithComponents.queryItems = [apiQuery, searchQuery]
        
        let finalURL = urlWithComponents.url!
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error { print("Error: \(error.localizedDescription)") ; completion([]) ; return }
            
            guard let data = data else { completion([]) ; return }
            
            guard let fullJSONFile = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] else { completion([]) ; return }
            
            guard let arrayOfMoviesInJSON = fullJSONFile["results"] as? [[String : Any]] else { completion([]) ; return }
            
            let arrayOfMovieObjects = arrayOfMoviesInJSON.flatMap({ (dictionary) -> Movie? in
                return Movie(dictionary: dictionary)
            })
            
            completion(arrayOfMovieObjects)
        }
        
        dataTask.resume()
        
    }
    
    static func grabMoviePosterFor(movie: Movie, sizeOfPoster: MoviePosterSize, completion: @escaping (UIImage?) -> Void) {
        
        
        
        guard let imageURL = baseImageURL?.appendingPathComponent(sizeOfPoster.rawValue).appendingPathComponent(movie.posterPath) else { completion(nil) ; return }
        
        var request = URLRequest(url: imageURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error { print("Error: \(error.localizedDescription)") ; completion(nil) ; return }
            
            guard let data = data else { completion(nil) ; return }
            
            let image = UIImage(data: data)
            
            completion(image)
        }
        
        dataTask.resume()
        
    }
        
    static func howManyStars(rating: Double) -> String {
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













