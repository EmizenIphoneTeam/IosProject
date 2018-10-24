//
//  DoctorDetailsViewController.swift
//  DoctorFinder
//
//  Created by Emizentech on 12/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import ACProgressHUD_Swift
import SDWebImage

class DoctorDetailsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var doctorId : String = ""

    
    @IBOutlet weak var doctorTableView: UITableView!
    @IBOutlet weak var DoctorMobilenoBtn: UIButton!
    @IBOutlet weak var doctorProfileImg: UIImageView!
    @IBOutlet weak var doctorNamelbl: UILabel!
    @IBOutlet weak var doctorheadlbl: UILabel!
    @IBOutlet weak var doctordegreelbl: UILabel!
    @IBOutlet weak var Expertiselbl: UILabel!
    @IBOutlet weak var expertiseDetaillbl: UILabel!
    @IBOutlet weak var serviceofferedlbl: UILabel!
    @IBOutlet weak var serviceDetaillbl: UILabel!
    
    

    
    var sections = [Section]()
    var docorDetail = DoctorDetailsModel()
    
    //var tableViewData = [cellData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
sections = [Section(name: "EXPERIENCE", items: ["EXPERIENCE 1", "EXPERIENCE 2","EXPERIENCE 3"]),Section(name: "SCORECARD", items: ["SCORECARD 1", "SCORECARD 2","SCORECARD 3"]),Section(name: "PROFESSIONAL HIGHLIGHT",items: ["PROFESSIONAL HIGHLIGHT 1", "PROFESSIONAL HIGHLIGHT 1","PROFESSIONAL HIGHLIGHT 1"]),Section(name: "TESTIMONIAL",items: ["TESTIMONIAL 1", "TESTIMONIAL 2","TESTIMONIAL 3"]),Section(name: "CASES",items: ["CASES 1", "CASES 2","CASES 3"])]
  
        doctorTableView.estimatedRowHeight = 44.0
        doctorTableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let back = UIBarButtonItem(image: UIImage(named: "left_back"), style: .plain , target: self, action: #selector(tappedBack))
        back.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = back
        
        getDoctorProfile()
       
    }
    
    
    @objc func tappedBack() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func DoctorMobilenoBtn(_ sender: UIButton) {
        
    }
    
    
    func getDoctorProfile()
    {
        if Alert_Reachability.connectedToNetwork()
        {
            ACProgressHUD.shared.showHUD()
            DOCTOR_DETAILS(DocterId: doctorId,success: {(message) -> Void in
                
                
                self.DoctorProfile1()
                
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
    
    func DoctorProfile1()
    {
        doctorNamelbl.text = AllDoctordetail.full_name
        DoctorMobilenoBtn.titleLabel?.text = AllDoctordetail.mobile
        expertiseDetaillbl.text = AllDoctordetail.user_expertise
        serviceDetaillbl.text = AllDoctordetail.user_services_offered
        doctorheadlbl.text = AllDoctordetail.user_specification
         
        
        var imgName : NSString = ""
        imgName = docorDetail.thumb_image as NSString
        if imgName == ""
        {
            doctorProfileImg.image = UIImage(named: "doctor")
        }
        else
        {
            let imgURL: NSURL = NSURL(string: imgName as String)!
            doctorProfileImg.sd_setImage(with: imgURL as URL)
        }
        
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
        cell.textLabel?.font =  UIFont.systemFont(ofSize: 18.0)
        
        cell.textLabel?.textColor =  UIColor.white
        cell.contentView.backgroundColor =  BackgroundColor
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[(indexPath as NSIndexPath).section].collapsed! ? 0 : 44.0
    }
    
    // Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.backgroundColor =  BackgroundColor
        header.titleLabel.text = sections[section].name
        
        header.arrowLabel.text = ">"
        
        
        header.setCollapsed(sections[section].collapsed)
        header.section = section
        header.delegate = self
        return header
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10.0
    }
}

extension DoctorDetailsViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        // Reload the whole section
        doctorTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
}



struct Section {
    var name: String
    var items: [String]
    var collapsed: Bool!
    
    init(name: String, items: [String], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}


//struct cellData {
//
//    var opened = Bool()
//    var title = String()
//    var sectionData = [String]()
//
//}
