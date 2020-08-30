//
//  FlixCellTableViewCell.swift
//  flix
//
//  Created by admin on 8/30/20.
//  Copyright © 2020 MrugeshMaster. All rights reserved.
//

import UIKit

class FlixCell: UITableViewCell {

    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
