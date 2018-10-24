//
//  MenuTableViewCell.swift
//  DoctorFinder
//
//  Created by Emizentech on 12/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var LblCell: UILabel!
    @IBOutlet weak var Iconimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
