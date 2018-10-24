//
//  DoctorProfileModel.swift
//  DoctorFinder
//
//  Created by Emizentech on 19/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class DoctorProfileModel: NSObject {
    
      var acessKey:String! = ""
      var user_id:String! = ""
      var user_specification:String! = ""
      var user_fellowships:String! = ""
      var user_expertise:String! = ""
      var user_services_offered:String! = ""
      var user_languages:String! = ""
      var user_experience:String! = ""
      var user_highlights:String! = ""
      var user_image:String! = ""
      var full_name:String! = ""
      var mobile:String! = ""
      var address:String! = ""
    

    override init() {}
    
    init(dictionary: NSDictionary) {
        if let acessKey = dictionary.value(forKey: "id") as? String {
            self.acessKey = acessKey
        }
        if let user_id = dictionary.value(forKey: "user_id") as? String {
            self.user_id = user_id
        }
        if let user_specification = dictionary.value(forKey: "user_specification") as? String {
            self.user_specification = user_specification
        }
        if let user_fellowships = dictionary.value(forKey: "user_fellowships") as? String {
            self.user_fellowships = user_fellowships
        }
        if let user_expertise = dictionary.value(forKey: "user_expertise") as? String {
            self.user_expertise = user_expertise
        }
        if let user_services_offered = dictionary.value(forKey: "user_services_offered") as? String {
            self.user_services_offered = user_services_offered
        }

        if let user_expertise = dictionary.value(forKey: "user_expertise") as? String {
            self.user_expertise = user_expertise
        }

        if let user_languages = dictionary.value(forKey: "user_languages") as? String {
            self.user_languages = user_languages
        }

        if let user_experience = dictionary.value(forKey: "user_experience") as? String {
            self.user_experience = user_experience
        }
        if let user_highlights = dictionary.value(forKey: "user_highlights") as? String {
            self.user_highlights = user_highlights
        }

        if let user_image = dictionary.value(forKey: "user_image") as? String {
            self.user_image = user_image
        }
        if let full_name = dictionary.value(forKey: "full_name") as? String {
            self.full_name = full_name
        }
        if let mobile = dictionary.value(forKey: "mobile") as? String {
            self.mobile = mobile
        }
        if let address = dictionary.value(forKey: "address") as? String {
            self.address = address
        }

    }
}
