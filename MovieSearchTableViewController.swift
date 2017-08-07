
//
//  MovieSearchTableViewController.swift
//  MOVsEE
//
//  Created by Joe Lucero on 8/4/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController {
    
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table View Data Source
extension MovieSearchTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        cell.movieImageView.image = nil
        cell.updateViewsFor(movie: movie)
        
        return cell
    }
}

// MARK: - Table View Data Source
extension MovieSearchTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        MovieController.grabAllMoviesWith(usersSearchTerm: searchText) { (movies) in
            self.movies = movies
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

// MARK: - Navigation
extension MovieSearchTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetail" {
            
            
            guard let detailVC = segue.destination as? MovieDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            detailVC.movie = movies[indexPath.row]
        }
    }
}








