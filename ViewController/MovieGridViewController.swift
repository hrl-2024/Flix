//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Henry Liu on 2/27/22.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var MovieCollectionView: UICollectionView!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieCollectionView.delegate = self
        MovieCollectionView.dataSource = self

        let layout = MovieCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4  // set the line spacing in btw the rolls
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3 // access the width of the phone
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        
        // Do any additional setup after loading the view.
        getAPIData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
        // adding poster images
        cell.posterView.af.setImage(withURL: movie.posterURL!)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        
        if let indexPath = MovieCollectionView.indexPath(for: cell) {
            
            let movie = movies[indexPath.item]
            
            let detailsViewController = segue.destination as! SuperheroMovieDetailViewController
            detailsViewController.movie = movie
        }
    }
    
    
    // Helper function: Get data from API helper and retrieve restaurants
    func getAPIData() {
        
        let APIURL = "https://api.themoviedb.org/3/movie/634649/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        
        API.getMovies(with: APIURL) { (movie) in
            guard let movie = movie else {
                // make sure movies is not empty
                return
            }
            self.movies = movie
            self.MovieCollectionView.reloadData()
        }
    }
}
