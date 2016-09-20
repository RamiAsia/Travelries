//
//  MomentTableViewCell.swift
//  Travelries
//
//  Created by Rami on 9/20/16.
//  Copyright © 2016 Rami. All rights reserved.
//

import UIKit

class MomentTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var momentPhoto: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
