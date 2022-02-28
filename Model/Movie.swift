//
//  Movie.swift
//  Flix
//
//  Created by Henry Liu on 2/27/22.
//

import Foundation

class Movie {
    
    var title : String
    var synopsis : String
    var posterURL : URL?
    var backdropURL : URL?
    
    init(dict: [String: Any]) {
        title = dict["title"] as! String
        synopsis = dict["overview"] as! String
        
        let imageBaseUrl = "https://image.tmdb.org/t/p/w185"
        let backdropBaseUrl = "https://image.tmdb.org/t/p/w780"
        
        posterURL = URL(string: imageBaseUrl +  (dict["poster_path"] as! String))
        
        // use "?" and "??" because backdrop might not come with the superhero API
        backdropURL = URL(string: backdropBaseUrl + (dict["backdrop_path"] as? String ?? ""))
    }
}
