//
//  RegisterViewController.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ACProgressHUD_Swift

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var BtnFreelancerDoctor: UIButton!
    @IBOutlet weak var imgFreelancerDoctor: UIImageView!
    @IBOutlet weak var txtusername: UITextField!
    
    @IBOutlet weak var txtMobileNo: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
   
    
    
    
    override func viewDidLoad() {
        
        txtPassword.setPadding(left: 5)
        txtusername.setPadding(left: 5)
        txtMobileNo.setPadding(left: 5)
        
       
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let back = UIBarButtonItem(image: UIImage(named: "left_back"), style: .plain , target: self, action: #selector(tappedBack))
        back.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = back
        
        imgFreelancerDoctor.layer.borderWidth = 10
        imgFreelancerDoctor.layer.masksToBounds = false
        imgFreelancerDoctor.layer.borderColor = UIColor.white.cgColor
        imgFreelancerDoctor.layer.cornerRadius = imgFreelancerDoctor.frame.width/2
        
        btnRegister.layer.cornerRadius = 10.0
        
        BtnFreelancerDoctor.layer.cornerRadius = 10.0
        
        txtMobileNo.layer.cornerRadius = 10.0
        txtusername.layer.cornerRadius = 10.0
        txtPassword.layer.cornerRadius = 10.0
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tappedBack() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }

    @IBAction func BtnRegister_didSelect(_ sender: UIButton)
    {
        if callVelidation()
        {
            if Alert_Reachability.connectedToNetwork()
            {
                
                ACProgressHUD.shared.showHUD()
                
                REGISTER_IN(EmailId: txtMobileNo.text!, Password: txtPassword.text!, FullName: txtusername.text!, UserType: "Doctor" , success: {(message) -> Void in
                    
                   
                    ACProgressHUD.shared.hideHUD()
                    self.txtMobileNo.text = ""
                    self.txtPassword.text = ""
                    self.txtusername.text = ""
                }, errorClosure: {(errormessage) -> Void in
                    ACProgressHUD.shared.hideHUD()
                    Alert_Reachability.ShowAlert(alertMessage: errormessage as NSString)
                })
                
            }
                
            else
            {
                Alert_Reachability.ShowAlert(alertMessage: kMsgInternetConn as NSString)
            }
            
        }
    }
    
    
    @IBAction func BtnLoginNow_didSelect(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func callVelidation() -> Bool
    {
        if txtMobileNo.text == ""
        {
            Alert_Reachability.ShowAlert(alertMessage: "Enter your Email Address ")
            return false
        }
        else if validateEmail(enteredEmail: txtMobileNo.text!) == false
        {
            Alert_Reachability.ShowAlert(alertMessage: "Enter your Valid Email Address")
            return false
        }
        else if txtusername.text == ""
        {
            Alert_Reachability.ShowAlert(alertMessage: "Enter your FullName")
            return false
        }
        else if txtPassword.text == ""
        {
            Alert_Reachability.ShowAlert(alertMessage: "Enter your password")
            return false
        }
       
        
        return true
    }
    
    
}
