//
//  ForgotPasswordVC.swift
//  DoctorFinder
//
//  Created by Emizentech on 17/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import ACProgressHUD_Swift

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var otpTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
         emailTxt.setPadding(left: 5)
         otpTxt.setPadding(left: 5)
          otpTxt.isHidden = true
        // Do any additional setup after loading the view.
      
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let back = UIBarButtonItem(image: UIImage(named: "left_back"), style: .plain , target: self, action: #selector(tappedBack))
        back.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = back
    }
    @objc func tappedBack() {
        
    self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func submitBtn(_ sender: UIButton) {
        if emailTxt.text != ""
        {
       otpTxt.isHidden = false
            getSendOtp()
        }
        else
        {
            Alert_Reachability.ShowAlert(alertMessage: "Enter Your Email Id")
            
        }
    }
    
  func getSendOtp()
    {
       if Alert_Reachability.connectedToNetwork()
            {
             ACProgressHUD.shared.showHUD()
                SEND_OTP(Email: emailTxt.text!, Otp: otpTxt.text!, success: {(message) -> Void in
                    
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
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
