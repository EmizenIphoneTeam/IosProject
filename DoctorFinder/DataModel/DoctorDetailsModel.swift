//
//  DoctorDetailsModel.swift
//  DoctorFinder
//
//  Created by Emizentech on 18/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class DoctorDetailsModel: NSObject,NSCoding {

    
    var full_name:String! = ""
    var email_id:String! = ""
    var mobile:String! = ""
    var address:String! = ""
    var user_specification:String! = ""
    var user_fellowships:String! = ""
    var user_expertise:String! = ""
    var user_services_offered:String! = ""
    var user_languages:String! = ""
    var user_experience:String! = ""
    var user_highlights:String! = ""
    var user_image:String = ""
    var thumb_image:String = ""
    var languageIds:String! = ""
    var specificationIds:String! = ""
    
    override init() {}
    
    init(dictionary:NSDictionary)
    {
        if let full_name = dictionary.value(forKey: "full_name") as? String
        {
            self.full_name = full_name
        }
        if let email_id = dictionary.value(forKey: "email_id") as? String
        {
            self.email_id = email_id
        }

        if let mobile = dictionary.value(forKey: "mobile") as? String
        {
            self.mobile = mobile
        }

        if let address = dictionary.value(forKey: "address") as? String
        {
            self.address = address
        }

        if let user_specification = dictionary.value(forKey: "user_specification") as? String
        {
            self.user_specification = user_specification
        }

        if let user_fellowships = dictionary.value(forKey: "user_fellowships") as? String
        {
            self.user_fellowships = user_fellowships
        }

        if let user_expertise = dictionary.value(forKey: "user_expertise") as? String
        {
            self.user_expertise = user_expertise
        }

        if let user_services_offered = dictionary.value(forKey: "user_services_offered") as? String
        {
            self.user_services_offered = user_services_offered
        }

        if let user_languages = dictionary.value(forKey: "user_languages") as? String
        {
            self.user_languages = user_languages
        }

        if let user_experience = dictionary.value(forKey: "user_experience") as? String
        {
            self.user_experience = user_experience
        }

        if let user_highlights = dictionary.value(forKey: "user_highlights") as? String
        {
            self.user_highlights = user_highlights
        }

        if let user_image = dictionary.value(forKey: "user_image") as? String
        {
            self.user_image = user_image
        }

        if let thumb_image = dictionary.value(forKey: "thumb_image") as? String
        {
            self.thumb_image = thumb_image
        }

        if let languageIds = dictionary.value(forKey: "languageIds") as? String
        {
            self.languageIds = languageIds
        }
        if let specificationIds = dictionary.value(forKey: "specificationIds") as? String
        {
            self.specificationIds = specificationIds
        }
       


    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        //self.full_name = aDecoder.decodeInteger(forKey: "full_name") as! String
        self.full_name = aDecoder.decodeObject(forKey: "full_name") as! String
//        self.mobile = aDecoder.decodeObject(forKey: "mobile") as! String
//        self.email_id = aDecoder.decodeObject(forKey: "email_id") as! String
//        self.password = aDecoder.decodeObject(forKey: "password") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        
        //aCoder.encode(id, forKey: "id")
        aCoder.encode(full_name, forKey: "full_name")
//        aCoder.encode(mobile, forKey: "email_id")
//        aCoder.encode(email_id, forKey: "mobile")
//        aCoder.encode(password, forKey: "password")
    }
}
