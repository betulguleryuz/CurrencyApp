//
//  CurrencyTableViewCell.swift
//  CurrencyApp
//
//  Created by betul on 27.10.2020.
//  Copyright © 2020 betul. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyImageView: UIImageView!
    
    @IBOutlet weak var currencyNameLabel: UILabel!
    
    @IBOutlet weak var currencyRateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
