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
    var movies = [[String : Any]]()   // create, using constructor, an array of dictionary with key type String and value type of Any

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
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        
        // adding poster images
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseUrl + posterPath)
        
        cell.posterView.af.setImage(withURL: posterURL!)
        
        return cell
    }

    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getMovies() { (movie) in
            guard let movie = movie else {
                // make sure movies is not empty
                return
            }
            print(movie)
            self.movies = movie
            self.MovieTableView.reloadData() // reloading the data
        }
    }
}

