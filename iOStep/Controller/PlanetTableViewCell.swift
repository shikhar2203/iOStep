//
//  PlanetTableViewCell.swift
//  iOStep
//
//  Created by Shashwat Singh on 16/8/22.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {
    @IBOutlet weak var PlanetName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
