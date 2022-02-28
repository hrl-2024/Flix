//
//  SuperheroMovieDetailViewController.swift
//  Flix
//
//  Created by Henry Liu on 2/27/22.
//

import UIKit

class SuperheroMovieDetailViewController: UIViewController {
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
