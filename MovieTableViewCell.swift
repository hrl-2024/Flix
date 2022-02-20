//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Henry Liu on 2/20/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
