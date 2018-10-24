//
//  DoctorListTableViewCell.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 10/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class DoctorListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDoctorExperties: UILabel!
    @IBOutlet weak var lblDepartement: UILabel!
    @IBOutlet weak var lblDoctorDegree: UILabel!
    
    @IBOutlet weak var btnViewProfile: UIButton!
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var cellBtn: UIButton!
    @IBOutlet weak var lblDoctorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
