//
//  ResultCollectionViewCell.swift
//  SportsContinued
//
//  Created by Mostafa Zidan on 3/30/21.
//  Copyright © 2021 Mostafa Zidan. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
