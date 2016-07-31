//
//  CustomTableViewCell.swift
//  unihack.estimote
//
//  Created by Terra on 30/07/2016.
//  Copyright © 2016 self. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var patientImage: UIImageView!
    @IBOutlet var patientName: UILabel!
    @IBOutlet var patientGenderDOB: UILabel!

    @IBOutlet var medicare: UILabel!
    @IBOutlet var UR: UILabel!
    @IBOutlet var language: UILabel!
    @IBOutlet var ethnicity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
