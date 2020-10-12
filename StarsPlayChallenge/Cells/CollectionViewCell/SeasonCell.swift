//
//  SeasonCell.swift
//  GetCountries
//
//  Created by Bukhari Syed Saood on 10/11/20.
//  Copyright © 2020 TerabyteLogixs. All rights reserved.
//

import UIKit

class SeasonCell: UICollectionViewCell {
    
    @IBOutlet weak var seasonNumberLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureSeasonCell(season: [Seasons]?, row: Int) {
        guard let allSeason = season else { return}
        let currentSeason = allSeason[row]
        seasonNumberLabel.text = "SEASON \(currentSeason.season_number ?? 0)"
    }
}
