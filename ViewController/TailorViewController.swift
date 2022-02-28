//
//  TailorViewController.swift
//  Flix
//
//  Created by Henry Liu on 2/28/22.
//

import UIKit
import WebKit

class TailorViewController: UIViewController, WKUIDelegate {
    
    // passed-in property:
    var movieID : Int64!
    
    var youtubeKey : String?
    
    // variable for WebKit
    var webView : WKWebView!
    
    // webview loading
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Current movie ID is: " + String(movieID))
        
        let APIURL = "https://api.themoviedb.org/3/movie/" + String(movieID) + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        
        print("Current APIURL is: " + String(APIURL))
        
        // ---- Connect API and get YoutubeKey
        let url = URL(string: APIURL)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
 
                    // TODO: Get the array of movies
                    let movie = dataDictionary["results"] as! [[String:Any]]
                    // TODO: Get the Youtube Key and Store it
                    self.youtubeKey = (movie[0]["key"] as! String)
                 
                    print("Youtube Key is: " + (self.youtubeKey ?? "No_Key"))
                 
                    let YouTubeURL = "https://www.youtube.com/watch?v=" + (self.youtubeKey ?? "NO_KEY")
                    print(YouTubeURL)
                 
                     // displaying website onscreen:
                     let myURL = URL(string:YouTubeURL)
                     let myRequest = URLRequest(url: myURL!)
                    self.webView.load(myRequest)
             }
        }
        task.resume()
    }
}
