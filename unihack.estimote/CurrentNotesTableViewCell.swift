//
//  CurrentNotesTableViewCell.swift
//  unihack.estimote
//
//  Created by Terra on 31/07/2016.
//  Copyright © 2016 self. All rights reserved.
//

import UIKit

class CurrentNotesTableViewCell: UITableViewCell {
    
    @IBOutlet var dateTimeLabel: UILabel!
    @IBOutlet var doctorName: UILabel!

    @IBOutlet var notesTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
