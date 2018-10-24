//
//  LoginViewController.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ACProgressHUD_Swift

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var btnFreelancerDoctor: UIButton!
    @IBOutlet weak var imgFreelancerDoctor: UIImageView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        
        
        
        txtPassword.setPadding(left: 5)
        txtMobileNo.setPadding(left: 5)
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        let back = UIBarButtonItem(image: UIImage(named: "left_back"), style: .plain , target: self, action: #selector(tappedBack))
        back.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = back
        
        imgFreelancerDoctor.layer.borderWidth = 10
        imgFreelancerDoctor.layer.masksToBounds = false
        imgFreelancerDoctor.layer.borderColor = UIColor.white.cgColor
        imgFreelancerDoctor.layer.cornerRadius = imgFreelancerDoctor.frame.width/2
        
        btnLogin.layer.cornerRadius = 10.0
        btnFreelancerDoctor.layer.cornerRadius = 10.0
        txtMobileNo.layer.cornerRadius = 10.0
        txtPassword.layer.cornerRadius = 10.0
        
        txtMobileNo.text = "hospital@gmail.com"
        txtPassword.text = "admin123"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func tappedBack() {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func forgotBtn(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func BtnLogin_didSelect(_ sender: UIButton)
    {
        if callVelidation()
        {
            if Alert_Reachability.connectedToNetwork()
            {
                
                ACProgressHUD.shared.showHUD()
                
                LOG_IN(EmailId: txtMobileNo.text!, Password: txtPassword.text!, success: {(message) -> Void in
                    
                    UserDefaults.standard.set(true, forKey: kLogin)
                    
                    
                    let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: userDetails)
                    UserDefaults.standard.set(encodedData, forKey: kUserDetails)
                    
                    
                    self.txtMobileNo.text = ""
                    self.txtPassword.text = ""
                    
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SWRevealViewController") as? SWRevealViewController
                    self.navigationController?.pushViewController(vc!, animated: true)
                    ACProgressHUD.shared.hideHUD()
                    
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
    
    @IBAction func BtnRegister_didSelect(_ sender: UIButton)
    {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
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
        else if txtPassword.text == ""
        {
            Alert_Reachability.ShowAlert(alertMessage: "Enter your password")
            return false
        }
        
        return true
    }
    
    
    
    
    
}


