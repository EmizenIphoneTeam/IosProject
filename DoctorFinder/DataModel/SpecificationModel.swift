//
//  SpecificationModel.swift
//  DoctorFinder
//
//  Created by Emizentech on 13/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class SpecificationModel: NSObject {

    var id:String! = ""
    var specification:String! = ""
    var status:String! = ""
    var added_date:String! = ""
    var modified_date: String = ""
    
    override init() {}
    
    init(dictionary: NSDictionary) {
        if let id = dictionary.value(forKey: "id") as? String {
            self.id = id
        }
        if let specification = dictionary.value(forKey: "specification") as? String {
            self.specification = specification
        }
        if let status = dictionary.value(forKey: "status") as? String {
            self.status = status
        }
        if let added_date = dictionary.value(forKey: "added_date") as? String {
            self.added_date = added_date
        }
        if let modified_date = dictionary.value(forKey: "modified_date") as? String {
            self.modified_date = modified_date
        }
    }
}
