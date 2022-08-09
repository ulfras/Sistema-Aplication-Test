//
//  MealsListTableViewCell.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

import UIKit

class MealsListTableViewCell: UITableViewCell {

    @IBOutlet weak var mealsImageOutlet: UIImageView!
    @IBOutlet weak var mealsNameLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mealsImageOutlet.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
