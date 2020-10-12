//
//  TableViewCell.swift
//  GetCountries
//
//  Created by Bukhari Syed Saood on 10/11/20.
//  Copyright © 2020 TerabyteLogixs. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var seasonNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func confifureEpisodeCell(episode: Episodes?) {
        guard let currentEpisode = episode else { return }
        seasonNameLabel.text = currentEpisode.name
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
