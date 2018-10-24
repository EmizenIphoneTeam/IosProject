//
//  Extension.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setPadding(left: CGFloat? = nil){
        if let left = left {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    }



 func validateEmail(enteredEmail: String) -> Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: enteredEmail)
}

extension NSObject
{
    func getUserDetails() -> LoginDataModel
    {
        
        if UserDefaults.standard.object(forKey: kUserDetails) != nil
        {
            let decode: Data = (UserDefaults.standard.object(forKey: kUserDetails) as? Data)!
            print(decode)
            do {
                let decodeduserData = NSKeyedUnarchiver.unarchiveObject(with: decode as Data) as! LoginDataModel
                return decodeduserData
            }
        }
        return LoginDataModel()
        
    }
}
extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        self.layer.add(animation, forKey: nil)
    }
}
extension AppDelegate {
    //#Mark: Variables
    var appDelegate:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func isLogin() -> Bool {
        let login = UserDefaults.standard.bool(forKey: kLogin)
        return login
    }
    
}

