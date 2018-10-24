//
//  SpecifyTableViewCell.swift
//  DoctorFinder
//
//  Created by Emizentech on 16/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class SpecifyTableViewCell: UITableViewCell {

    @IBOutlet weak var txtlabel: UILabel!
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var buttonImg: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
