//
//  MovieController.swift
//  MOVsEE
//
//  Created by Joe Lucero on 8/4/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import Foundation

class MovieController {
    
    private static let myAPIValue = "241e7cdd9c39c228149aecefa596fdbb"
    private static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    private static let apiKey = "api_key"
    private static let nameKey = "query"
    
    static func grabAllMoviesWith(usersSearchTerm search: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let baseURL = baseURL else { completion([]) ; return }
        
        guard var urlWithComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else { completion([]) ; return }
        let apiQuery = URLQueryItem(name: apiKey, value: myAPIValue)
        let searchQuery = URLQueryItem(name: nameKey, value: search)
        
        urlWithComponents.queryItems = [apiQuery, searchQuery]
        
        let finalURL = urlWithComponents.url!
        print(finalURL.absoluteString)
        
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
    
    
}
