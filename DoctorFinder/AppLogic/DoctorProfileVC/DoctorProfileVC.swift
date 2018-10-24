//
//  DoctorProfileVC.swift
//  DoctorFinder
//
//  Created by Emizentech on 12/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import ACProgressHUD_Swift
import Alamofire
import SwiftyJSON

class DoctorProfileVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var profileImgBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var languageTableView: UITableView!
    @IBOutlet weak var specifyTableView: UITableView!
    @IBOutlet weak var SubmitBtn: UIButton!
    @IBOutlet weak var DoctorprofileImg: UIImageView!
    @IBOutlet weak var freelancerlbl: UIButton!
   
    @IBOutlet weak var nameTxt: CustomTextField!
    
    @IBOutlet weak var emailTxt: CustomTextField!
    @IBOutlet weak var mobileTxt: CustomTextField!
    
    @IBOutlet weak var experienceTxt: CustomTextField!
    @IBOutlet weak var professionalTxt: CustomTextField!
    @IBOutlet weak var languageTxt: CustomTextField!
    @IBOutlet weak var serviceOfferedTxt: CustomTextField!
    @IBOutlet weak var expertiseTxt: CustomTextField!
    @IBOutlet weak var fellowshipsTxt: CustomTextField!
    @IBOutlet weak var specificationTxt: CustomTextField!
    @IBOutlet weak var addressTxt: CustomTextField!
  
    
    let myPickerController = UIImagePickerController()
      var arrayCheckUnchek = [String]()
    var DoctorLanguageArray = [LanguageModel]()
    var DoctorSpecifyArray = [SpecificationModel]()
    
    //var specificationname = ["Md","HD"]
    //var languagename = ["English","Hindi","Marathi"]
   
    var selectedRows:[IndexPath] = []
    var selectedRowslanguage:[IndexPath] = []
  var arrSelectedFields = [String]()
    var arrSelectedFieldsIDs = [String]()
    
    var arrlanguageField = [String]()
    var arrlanguageFieldIDs = [String]()
    
    var strSpecicfy : String = ""
    var strLanguage: String = ""
    
    var unchecked = true
    // var keyboardHandler : IQKeyboardReturnKeyHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameTxt.setPadding(left: 5)
        mobileTxt.setPadding(left: 5)
        emailTxt.setPadding(left: 5)
        addressTxt.setPadding(left: 5)
        specificationTxt.setPadding(left: 5)
        fellowshipsTxt.setPadding(left: 5)
        expertiseTxt.setPadding(left: 5)
        serviceOfferedTxt.setPadding(left: 5)
        languageTxt.setPadding(left: 5)
        experienceTxt.setPadding(left: 5)
        professionalTxt.setPadding(left: 5)
        
         customView.isHidden = true


        DoctorprofileImg.layer.cornerRadius = DoctorprofileImg.frame.height/2
        DoctorprofileImg.layer.borderWidth = 2
        DoctorprofileImg.layer.borderColor = UIColor.white.cgColor
        DoctorprofileImg.clipsToBounds = true
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let back = UIBarButtonItem(image: UIImage(named: "left_back"), style: .plain , target: self, action: #selector(tappedBack))
        back.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = back
        
       languageTableView.isHidden = true
        specifyTableView.isHidden = true
        
        specifyTableView.delegate = self
        specifyTableView.dataSource = self
        languageTableView.delegate = self
        languageTableView.dataSource = self
       
        self.specifyTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.languageTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
        specificationlanguageDetails()
        
    NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTableView(notification:)), name: Notification.Name(kspecifyData), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.reloadLanguageTableView(notification:)), name: Notification.Name(kLanguageData), object: nil)
    }
    
    @objc func reloadTableView(notification:Notification) {
        DoctorSpecifyArray = specifyModel
        
        self.specifyTableView.reloadData()
       
    }
    
    @objc func reloadLanguageTableView(notification:Notification) {
        DoctorLanguageArray = languageModel
        self.languageTableView.reloadData()
    }
    @IBAction func profileImgBtn(_ sender: UIButton) {
         showActionSheet()
    }
    
    
    @IBAction func SpecificationBtn(_ sender: UIButton) {
        
        customView.isHidden = false
        specifyTableView.isHidden = false
        languageTableView.isHidden = true
        
    }
    

        
    
    
    @IBAction func LanguageBtn(_ sender: UIButton) {
        
      languageTableView.isHidden = false
      customView.isHidden = false
      specifyTableView.isHidden = true
   
    }
    
  
    @objc func tappedBack() {
        
        
        
   self.navigationController?.popViewController(animated: true)
        
        
        
    }
    @IBAction func SubmitBtn(_ sender: UIButton) {
        
        SaveDoctorProfile()
        
    
        
        }
    
    
    func camera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            myPickerController.allowsEditing = true
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            present(myPickerController, animated: true, completion: nil)
        }
        
    }
    func photoLibrary()
    {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            myPickerController.allowsEditing = true
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            present(myPickerController, animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            DoctorprofileImg.image = image
            
            
            
        }else{
            print("Something went wrong")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func showActionSheet() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func specificationlanguageDetails()
    {
        if Alert_Reachability.connectedToNetwork()
        {
            ACProgressHUD.shared.showHUD()
            
            LANGUAGE_SPECIFY(AcessKey: "getData", success: {(message) -> Void in
                 languageModel.removeAll()
                 specifyModel.removeAll()
                 ACProgressHUD.shared.hideHUD()
                
            }, errorClosure: {(errormessage) -> Void in
                
                ACProgressHUD.shared.hideHUD()
                languageModel.removeAll()
                specifyModel.removeAll()
                self.DoctorLanguageArray.removeAll()
                self.DoctorSpecifyArray.removeAll()
                self.specifyTableView.reloadData()
                self.languageTableView.reloadData()
                Alert_Reachability.ShowAlert(alertMessage: errormessage as NSString)
                
                
            })
        }
        else
        {
            Alert_Reachability.ShowAlert(alertMessage: kMsgInternetConn as NSString)
        }
        
    }
    
    
    func SaveDoctorProfile()
    {
        
        if Alert_Reachability.connectedToNetwork()
        {
            ACProgressHUD.shared.showHUD()
            
            let imageData:NSData = UIImagePNGRepresentation(DoctorprofileImg.image!)! as NSData
            
            for var i in 0 ..< (arrlanguageFieldIDs.count)
            {
            let bstr = arrlanguageFieldIDs[i]
            let str1 = NSString(format:"%@,%@",  strLanguage,bstr )
            strLanguage = str1 as String
            }
            for var i in 0 ..< (arrSelectedFieldsIDs.count)
            {
            let bstr = arrSelectedFieldsIDs[i]
            let str1 = NSString(format:"%@,%@",  strSpecicfy,bstr )
            strSpecicfy = str1 as String
            }
             let DoctorId: String = String(getUserDetails().id)
            
            DOCTOR_PROFILE(DocterId: DoctorId, AcessKey: "getData", Userspecification: strSpecicfy, Userfellowships: fellowshipsTxt.text!, Userexpertise: expertiseTxt.text!,Userservicesoffered: serviceOfferedTxt.text!, Userlanguages:
                strLanguage, Userexperience: expertiseTxt.text!, Userhighlights: professionalTxt.text!, Userimage: imageData as Data, Fullname: nameTxt.text!, Mobile: mobileTxt.text!, Address: addressTxt.text!, success: {(message) -> Void in
                    
                    self.arrlanguageField.removeAll()
                    self.arrlanguageFieldIDs.removeAll()
                    self.arrSelectedFields.removeAll()
                    self.arrSelectedFieldsIDs.removeAll()
                    self.selectedRows.removeAll()
                    self.selectedRowslanguage.removeAll()
                    self.languageTableView.reloadData()
                    self.specifyTableView.reloadData()
                    self.nameTxt.text = ""
                    self.mobileTxt.text = ""
                    self.languageTxt.text = ""
                    self.specificationTxt.text = ""
                    self.mobileTxt.text = ""
                    self.addressTxt.text = ""
                    self.professionalTxt.text = ""
                    self.fellowshipsTxt.text = ""
                    self.expertiseTxt.text = ""
                    self.serviceOfferedTxt.text = ""
                    self.expertiseTxt.text = ""
                    
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
    
    
  
        
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if tableView == self.specifyTableView {
            let textLabel = UILabel()
            textLabel.text = "Select Option"
            textLabel.textColor = UIColor.black
            textLabel.font = UIFont.boldSystemFont(ofSize: 17)
           
        } else {
            
            let textLabel = UILabel()
            textLabel.text = "Select Option"
            textLabel.textColor = UIColor.black
            textLabel.font = UIFont.boldSystemFont(ofSize: 17)
        }
     
       return view
    }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if tableView == self.specifyTableView {
            
        return DoctorSpecifyArray.count
        }
        else
        {
        return DoctorLanguageArray.count
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellToReturn = UITableViewCell()
       
        if tableView == self.specifyTableView
        {
            let cell = specifyTableView.dequeueReusableCell(withIdentifier: "CustomOne", for: indexPath as IndexPath) as?  SpecifyTableViewCell
            cell?.txtlabel.text = DoctorSpecifyArray[indexPath.row].specification
            
            if selectedRows.contains(indexPath)
            {
                cell?.buttonImg.setImage(UIImage(named:"tickcheck"), for: .normal)
            }
            else
            {
                cell?.buttonImg.setImage(UIImage(named:"checkbox"), for: .normal)
                
            }

               cell?.buttonImg.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)
            cell?.buttonImg.tag = indexPath.row
           
            return cell!
            
        }
        else
        {
            let cell = languageTableView.dequeueReusableCell(withIdentifier: "CustomTwo", for: indexPath as IndexPath) as?  LanguageTableViewCell
            cell?.txtlabel.text = DoctorLanguageArray[indexPath.row].language
            if selectedRowslanguage.contains(indexPath)
            {
                cell?.buttonimg.setImage(UIImage(named:"tickcheck"), for: .normal)
            }
            else
            {
                cell?.buttonimg.setImage(UIImage(named:"checkbox"), for: .normal)
            }
            cell?.buttonimg.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            cell?.buttonimg.tag = indexPath.row
            
            return cell!
            }
        return cellToReturn
         }
    
    @objc func checkBoxSelection(_ sender:UIButton)
    {
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        if self.selectedRows.contains(selectedIndexPath)
        {
            self.selectedRows.remove(at: self.selectedRows.index(of: selectedIndexPath)!)
            let a = DoctorSpecifyArray[sender.tag].id
            
            for var i in 0 ..< (arrlanguageFieldIDs.count)
            {
            if arrlanguageFieldIDs.contains(a!)
            {
            arrSelectedFields.remove(at: i)
            arrSelectedFieldsIDs.remove(at: i)
            }
                
            }
            // arrSelectedFields.append(dict.value(forKey: "id") as! String)
            
            var strSelectedFields = ""
            for var i in 0 ..< (selectedRows.count)
            {
                if strSelectedFields == ""
                {
                    strSelectedFields = arrSelectedFields[i]
                }
                else
                {
                    let aStr = arrSelectedFields[i]
                    let str = NSString(format:"%@,%@",  strSelectedFields,aStr )
                    strSelectedFields = str as String
                   
                }
            }
            specificationTxt.text = strSelectedFields
        }
            
        
        else
        {
            self.selectedRows.append(selectedIndexPath)
            
            let dict = DoctorSpecifyArray[sender.tag]
            arrSelectedFields.append(dict.specification)
            arrSelectedFieldsIDs.append(dict.id)
          
            
            var strSelectedFields = ""
            for var i in 0 ..< (selectedRows.count)
            {
                if strSelectedFields == ""
                {
                    strSelectedFields = arrSelectedFields[i]
                }
                else
                {
                    let aStr = arrSelectedFields[i]
                    let str = NSString(format:"%@,%@",  strSelectedFields,aStr )
                    strSelectedFields = str as String
                    
                }
            }
            specificationTxt.text = strSelectedFields
        }
            
        
        self.specifyTableView.reloadData()
    
}
    @objc func buttonTapped(_ sender: UIButton)
    {
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        if self.selectedRowslanguage.contains(selectedIndexPath)
        {
            self.selectedRowslanguage.remove(at: self.selectedRowslanguage.index(of: selectedIndexPath)!)
           // let dict = DoctorLanguageArray[sender.tag]
            
           arrlanguageFieldIDs.remove(at: sender.tag)
            arrlanguageField.remove(at: sender.tag)
            // arrSelectedFields.append(dict.value(forKey: "id") as! String)
            
            var strSelectedFields = ""
            for var i in 0 ..< (selectedRowslanguage.count)
            {
                if strSelectedFields == ""
                {
                    strSelectedFields = arrlanguageField[i]
                }
                else
                {
                    let aStr = arrlanguageField[i]
                    let str = NSString(format:"%@,%@",  strSelectedFields,aStr )
                    strSelectedFields = str as String
                   
                }
            }
            languageTxt.text = strSelectedFields
        }
            
            
        else
        {
            self.selectedRowslanguage.append(selectedIndexPath)
            
            let dict = DoctorLanguageArray[sender.tag]
            arrlanguageField.append(dict.language)
            arrlanguageFieldIDs.append(dict.id)
            
            
            var strSelectedFields = ""
            for var i in 0 ..< (selectedRowslanguage.count)
            {
                if strSelectedFields == ""
                {
                    strSelectedFields = arrlanguageField[i]
                }
                else
                {
                    let aStr = arrlanguageField[i]
                    let str = NSString(format:"%@,%@",  strSelectedFields,aStr )
                    strSelectedFields = str as String
                   
                }
            }
            languageTxt.text = strSelectedFields
        }
        
        
        self.languageTableView.reloadData()
        
    }
    
    
    

    
    @IBAction func deleteBtn(_ sender: Any) {
        customView.isHidden = true
        
      
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
