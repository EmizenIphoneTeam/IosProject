//
//  DoctorListViewController.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 10/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import ACProgressHUD_Swift
import SDWebImage

class DoctorListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    var DoctorListArray = [DoctorlistDataModel]()
    
    @IBOutlet weak var btnDoctorList: UIButton!
    @IBOutlet weak var DoctorListTableView: UITableView!
    override func viewDidLoad() {
        
        // self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        super.viewDidLoad()
        DoctorListTableView.dataSource = self
        DoctorListTableView.delegate = self
            
            // To give dynamic height of uitable view cell /
                DoctorListTableView.rowHeight = UITableViewAutomaticDimension
        DoctorListTableView.estimatedRowHeight = 192
        
        btnDoctorList.layer.cornerRadius = 10.0
        menuBtn.target = self.revealViewController()
        menuBtn.action = #selector(self.revealViewController().revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        getDoctorlistdata()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTableView(notification:)), name: Notification.Name(kDoctorListData), object: nil)
        
    }
    
   
    func getDoctorlistdata()
    {
        if Alert_Reachability.connectedToNetwork()
        {
            ACProgressHUD.shared.showHUD()
            DOCTOR_LIST_DATA(Page: "1", success: {(message) -> Void in
                allDoctorListData.removeAll()
                
                 self.DoctorListTableView.reloadData()
                
                ACProgressHUD.shared.hideHUD()
                
            }, errorClosure: {(errormessage) -> Void in
                ACProgressHUD.shared.hideHUD()
                allDoctorListData.removeAll()
                self.DoctorListArray.removeAll()
                self.DoctorListTableView.reloadData()
                
            })
        }
        else
        {
            Alert_Reachability.ShowAlert(alertMessage: kMsgInternetConn as NSString)
        }
        
    }
    
    @objc func reloadTableView(notification:Notification) {
        DoctorListArray = allDoctorListData
        self.DoctorListTableView.reloadData()
    }
    
   // Table View Data Source And Delegate Method /
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DoctorListArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell:DoctorListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DoctorCell") as?  DoctorListTableViewCell
        Cell?.cellBtn.tag = indexPath.row
       Cell?.cellBtn.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
        
      var imgName : NSString = ""
        imgName = DoctorListArray[indexPath.row].thumb_image as NSString
        if imgName == ""
        {
            Cell?.ImgView.image = UIImage(named: "doctor")
            
            
        }
        else
        {
            //let imgURL: NSURL = NSURL(string: imgName as String)!
          
           // Cell?.ImgView.sd_setImage(with: imgURL as URL)
            
            let sdDownloader = SDWebImageDownloader.shared()
            sdDownloader.username = "dev"
            sdDownloader.password = "dev"
            //let logoURL = UserDefaults.standard.value(forKey: "communityLogo") as? String
            if let url = URL(string: imgName as String)
           
            {
                sdDownloader.downloadImage(with: url, options: .continueInBackground, progress: { (_, _, _) in
                    
                }, completed: { (image, _, _, _) in
                   Cell?.ImgView.image = image
                    Cell?.ImgView.contentMode = .scaleAspectFit
                    
                })
                
            }
        }
        
        
        if DoctorListArray[indexPath.row].full_name != ""
        {
            Cell?.lblDoctorName.text = DoctorListArray[indexPath.row].full_name
        }
        else
        {
            Cell?.lblDoctorName.text = "NA"
        }
        if DoctorListArray[indexPath.row].user_specification != ""
        {
            Cell?.lblDoctorDegree.text = DoctorListArray[indexPath.row].user_specification
        }
        else
        {
            Cell?.lblDoctorDegree.text = "NA"
        }
        if DoctorListArray[indexPath.row].user_expertise != ""
        {
            Cell?.lblDoctorExperties.text = DoctorListArray[indexPath.row].user_expertise
        }
        else
        {
            Cell?.lblDoctorExperties.text = "NA"
        }
      
        
        
        
        
        
        
        return Cell!
        
    }
        @objc func buttonSelected(sender: UIButton)
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DoctorDetailsViewController") as? DoctorDetailsViewController
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 204
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Section index=",indexPath.section)
        
       let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DoctorDetailsViewController") as? DoctorDetailsViewController
            vc?.doctorId = DoctorListArray[indexPath.row].id
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
 
    
    
}
