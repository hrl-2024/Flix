//
//  API.swift
//  Flix
//
//  Created by Henry Liu on 2/20/22.
//

import Foundation

struct API {
        
    static func getMovies(with http: String, completion: @escaping ([Movie]?) -> Void) {
        let url = URL(string: http)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    // Get the array of movies
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                    // Store the movies in a property to use elsewhere
                 let moviesDict = dataDictionary["results"] as! [[String : Any]]
                 
                 // variable to store array of movies
                 var movies : [Movie] = []
                 
                 // fill the movies[]
                 for dictionary in moviesDict {
                     let movie = Movie.init(dict: dictionary)
                     movies.append(movie)
                 }
                 
                 // return with completion, which is an escapting method which allows the data to be used outside of the closure
                 return completion(movies)
             }
        }
        task.resume()
    }
}
