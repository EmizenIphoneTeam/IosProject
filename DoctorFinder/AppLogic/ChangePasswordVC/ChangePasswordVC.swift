//
//  ChangePasswordVC.swift
//  DoctorFinder
//
//  Created by Emizentech on 17/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import ACProgressHUD_Swift

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var oldPassTxt: UITextField!
    @IBOutlet weak var newPassTxt: UITextField!
    @IBOutlet weak var rePassTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let back = UIBarButtonItem(image: UIImage(named: "left_back"), style: .plain , target: self, action: #selector(tappedBack))
        back.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = back
        
        oldPassTxt.setPadding(left: 5)
        newPassTxt.setPadding(left: 5)
        rePassTxt.setPadding(left: 5)

       
    }
    @objc func tappedBack() {
        
        self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func SubmitBtn(_ sender: UIButton) {
        if oldPassTxt.text != "" && newPassTxt.text != "" && rePassTxt.text != "" && newPassTxt.text == rePassTxt.text
        {
             getChangePassword()
        }
        else
        {
            Alert_Reachability.ShowAlert(alertMessage: "Please Enter These Fields")
        }
    }
        
        func getChangePassword()
        {
            if Alert_Reachability.connectedToNetwork()
            {
                ACProgressHUD.shared.showHUD()
                let userId: String = String(getUserDetails().id)
                
                CHANGE_PASSWORD(UserId: userId, OldPassword: oldPassTxt.text!, NewPassword: newPassTxt.text!,success: {(message) -> Void in
                    
                    ACProgressHUD.shared.hideHUD()
                    
                }, errorClosure: {(errormessage) -> Void in
                    ACProgressHUD.shared.hideHUD()
                   
                   
                    
                })
            }
            else
            {
                Alert_Reachability.ShowAlert(alertMessage: kMsgInternetConn as NSString)
            }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    


}
