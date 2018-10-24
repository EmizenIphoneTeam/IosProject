//
//  TextField.swift
//  DoctorFinder
//
//  Created by Emizentech on 12/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import Foundation

class CustomTextField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(0, 5, 0, 5))
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(0, 5, 0, 5))
    }
}
