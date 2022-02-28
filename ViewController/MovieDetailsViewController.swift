//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Henry Liu on 2/27/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie : Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie.title
        titleLabel.sizeToFit()
        synopsisLabel.text = movie.synopsis
        synopsisLabel.sizeToFit()
        posterView.af.setImage(withURL: movie.posterURL!)
        backdropView.af.setImage(withURL: movie.backdropURL!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tailorViewController = segue.destination as! TailorViewController
        
        tailorViewController.movieID = movie.id
    }
}
