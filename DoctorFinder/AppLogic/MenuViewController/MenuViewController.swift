//
//  MenuViewController.swift
//  DoctorFinder
//
//  Created by Emizentech on 12/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileImgBtn: UIButton!
    
    
    
    
   let menuOption = ["Profile","About","Privacy Policy","Change Password","Facebook","Logout"]
    let ImageIcon = ["man-user (2)","man-user (2)","key","key","facebook","logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
   self.navigationController?.setNavigationBarHidden(true, animated: false)
        profileImg.layer.cornerRadius = profileImg.frame.height/2
         profileImg.layer.borderWidth = 2
        profileImg.layer.borderColor = UIColor.white.cgColor
        profileImg.clipsToBounds = true
        
       
         
    }
    
    override func viewWillAppear(_ animated: Bool) {
          self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return menuOption.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MenuTableViewCell
        cell?.LblCell.text = menuOption[indexPath.row]
        cell?.Iconimg.image = UIImage(named: ImageIcon[indexPath.row])
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DoctorProfileVC") as? DoctorProfileVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        else if indexPath.row == 3
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if indexPath.row == 5
        {
            logoutAlert(title: kLogout, message: kLogoutMsg)
        }
        
       
    }

   
    
    func logoutAlert(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        
        let logout = UIAlertAction(title: kLogout, style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            
            UserDefaults.standard.set(false, forKey: kLogin)
            
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers
            print("View controllers in naviegation stack = ",viewControllers)
            
            self.navigationController?.popToRootViewController(animated: true)
            
            
            
            self.dismiss(animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: kCancel, style: UIAlertActionStyle.cancel) {
            (result : UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(cancel)
        alertController.addAction(logout)
        self.present(alertController, animated: true, completion: nil)
    }
    

}
