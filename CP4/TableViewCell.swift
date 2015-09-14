//
//  TableViewCell.swift
//  CP4
//
//  Created by Sahil Shah on 12/09/2015.
//  Copyright © 2015 Sahil Shah. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    
        
    @IBOutlet weak var tempLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
