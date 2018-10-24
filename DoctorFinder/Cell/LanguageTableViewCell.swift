//
//  LanguageTableViewCell.swift
//  DoctorFinder
//
//  Created by Emizentech on 16/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var txtlabel: UILabel!
    @IBOutlet weak var buttonimg: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
