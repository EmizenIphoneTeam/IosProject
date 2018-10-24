//
//  LoginDataModel.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class LoginDataModel: NSObject, NSCoding
{
    
    
    var id = 0
    var full_name = ""
    var email_id = ""
    var mobile = ""
    var password = ""
   
    
    override init() { }
    
    init(dictionary:NSDictionary) {
       
        if let id = dictionary.value(forKey: "id") as? Int {
            self.id = id
        }
        if let full_name = dictionary.value(forKey: "full_name") as? String {
            self.full_name = full_name
        }
        if let mobile = dictionary.value(forKey: "mobile") as? String {
            self.mobile = mobile
        }
        if let email_id = dictionary.value(forKey: "email_id") as? String {
            self.email_id = email_id
        }
        if let password = dictionary.value(forKey: "password") as? String {
            self.password = password
        }
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        self.id = aDecoder.decodeInteger(forKey: "id")
        self.full_name = aDecoder.decodeObject(forKey: "full_name") as! String
        self.mobile = aDecoder.decodeObject(forKey: "mobile") as! String
        self.email_id = aDecoder.decodeObject(forKey: "email_id") as! String
         self.password = aDecoder.decodeObject(forKey: "password") as! String
    }
    
    func encode(with aCoder: NSCoder) {
       
        aCoder.encode(id, forKey: "id")
        aCoder.encode(full_name, forKey: "full_name")
        aCoder.encode(mobile, forKey: "email_id")
        aCoder.encode(email_id, forKey: "mobile")
         aCoder.encode(password, forKey: "password")
    }
}
