//
//  DoctorlistDataModel.swift
//  DoctorFinder
//
//  Created by Emizentech on 17/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class DoctorlistDataModel: NSObject {

    var id:String! = ""
    var full_name:String! = ""
    var user_specification:String! = ""
    var user_expertise:String! = ""
    var thumb_image: String = ""
    
    
    override init() {}
    
    init(dictionary:NSDictionary)
    {
        if let id = dictionary.value(forKey: "id") as? String {
            self.id = id
        }
        if let full_name = dictionary.value(forKey: "full_name") as? String
        {
            self.full_name = full_name
        }
        if let user_specification = dictionary.value(forKey: "user_specification") as? String
        {
            self.user_specification = user_specification
        }
        if let user_expertise = dictionary.value(forKey: "user_expertise") as? String
        {
            self.user_expertise = user_expertise
        }
        if let thumb_image = dictionary.value(forKey: "thumb_image") as? String
        {
            self.thumb_image = thumb_image
        }
    }

   
    

    

}
