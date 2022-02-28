//
//  ViewController.swift
//  Flix
//
//  Created by Henry Liu on 2/20/22.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // properties
    var movies = [Movie]()   // create by using constructor

    @IBOutlet weak var MovieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // connect tableview
        MovieTableView.dataSource = self
        MovieTableView.delegate = self
        
        getAPIData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueing reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
        
        // setting the text
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }

    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        
        let APIURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        
        API.getMovies(with: APIURL) { (movie) in
            guard let movie = movie else {
                // make sure movies is not empty
                return
            }
            self.movies = movie
            self.MovieTableView.reloadData() // reloading the data
        }
    }
    
    // sender: the cell that was tapped on
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Find the selected movie
        let cell = sender as! UITableViewCell
        if let indexPath = MovieTableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            
            // pass the selected movie to the MovieDetailsViewController
            let detailsViewController = segue.destination as! MovieDetailsViewController
            detailsViewController.movie = movie
            
            // deselect the row
            MovieTableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
