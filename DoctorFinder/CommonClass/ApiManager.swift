//
//  ApiManager.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON

let baseURL = "http://server102.emizentech.com/doctorfinder/ApiControl/"

func LOG_IN(EmailId:String,Password:String,success: @escaping (_ Message:String) -> Void  , errorClosure : @escaping (_ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["email_id": EmailId, "password":Password]
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    

    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
  
    
    Alamofire.request("\(baseURL)login", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    
    
   
    
    
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    let jsonText = json["data"].rawString()
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            //print(jsonDict)
                            userDetails = LoginDataModel(dictionary: jsonDict!)
                           
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                    success(json["message"].string!)
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure("Login Failed")
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("Response is nil")
        }
    }
}

func REGISTER_IN(EmailId:String,Password:String,FullName:String,UserType:String,success: @escaping (_ Message:String) -> Void  , errorClosure : @escaping (_ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["email_id": EmailId, "password":Password,"full_name":FullName,"user_type":UserType]
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    
    
    Alamofire.request("\(baseURL)register", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    
  //  Alamofire.request("\(baseURL)register",method:.post, parameters:parameters).validate().responseJSON { response in
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    let jsonText = json["data"].rawString()
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            print(jsonDict)
                           
                            
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                    success(json["message"].string!)
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure("Login Failed")
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("Response is nil")
        }
    }
}
func LANGUAGE_SPECIFY(AcessKey:String,success: @escaping (_ Message:String) -> Void  , errorClosure : @escaping (_ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["acessKey":AcessKey]
   
    
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    Alamofire.request("\(baseURL)api_lang_speci", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    
   // Alamofire.request("\(baseURL)api_lang_speci",method:.post, parameters:parameters).validate().responseJSON { response in
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    success("Api Hit")
                    let jsonText = json["data"].rawString()
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            
                           
                            for value in jsonDict?.value(forKey: "language") as! NSArray{
                                languageModel.append(LanguageModel(dictionary: value as! NSDictionary))
                            }
                            for value in jsonDict?.value(forKey: "specific") as! NSArray{
                                specifyModel.append(SpecificationModel(dictionary: value as! NSDictionary))
                            }
                           
                         
                            
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                        
                        NotificationCenter.default.post(name: Notification.Name(kspecifyData), object: nil)
                        NotificationCenter.default.post(name: Notification.Name(kLanguageData), object: nil)
                    }
                   // success(json["message"].string!)
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure(error.localizedDescription)
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("something worng")
        }
    }
}




func DOCTOR_LIST_DATA(Page:String,success: @escaping (  _ Message:String) -> Void  , errorClosure : @escaping (  _ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["page":Page]
    
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    Alamofire.request("\(baseURL)doctorlistdata", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    
    //Alamofire.request("\(baseURL)doctorlistdata",method:.post, parameters:parameters).validate().responseJSON { response in
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    success("Api Hit Sucessfully")
                    let jsonText = json.rawString()
                    
                    
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            for value in jsonDict?.value(forKey: "data") as! NSArray{
                                allDoctorListData.append(DoctorlistDataModel(dictionary: value as! NSDictionary))
                            }
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                    NotificationCenter.default.post(name: Notification.Name(kDoctorListData), object: nil)
                    
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure(error.localizedDescription)
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("something worng")
        }
    }
}
func CHANGE_PASSWORD(UserId:String,OldPassword:String,NewPassword:String,success: @escaping (  _ Message:String) -> Void  , errorClosure : @escaping (  _ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["user_id":UserId,"oldpassword":OldPassword,"newpassword":NewPassword]
    
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    Alamofire.request("\(baseURL)changepassword", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    //Alamofire.request("\(baseURL)changepassword",method:.post, parameters:parameters).validate().responseJSON { response in
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    success("Api Hit Sucessfully")
                    let jsonText = json.rawString()
                    
                    
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                           
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                  
                    
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure(error.localizedDescription)
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("something worng")
        }
    }
}
 
func SEND_OTP(Email:String,Otp:String,success: @escaping (  _ Message:String) -> Void  , errorClosure : @escaping (  _ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["user_id":Email,"otp":Otp]
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    Alamofire.request("\(baseURL)sendOtp", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    
  //  Alamofire.request("\(baseURL)sendOtp",method:.post, parameters:parameters).validate().responseJSON { response in
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    success("Api Hit Sucessfully")
                    let jsonText = json.rawString()
                    
                    
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                    
                    
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure(error.localizedDescription)
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("something worng")
        }
    }
}
func VARIFY_OTP(Email:String,Otp:Int,success: @escaping (  _ Message:String) -> Void  , errorClosure : @escaping (  _ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["user_id":Email,"otp":Otp]
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    Alamofire.request("\(baseURL)varifyOtp", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    
   // Alamofire.request("\(baseURL)varifyOtp",method:.post, parameters:parameters).validate().responseJSON { response in
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    success("Api Hit Sucessfully")
                    let jsonText = json.rawString()
                    
                    
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                    
                    
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure(error.localizedDescription)
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("something worng")
        }
    }
}
func FORGOT_PASSWORD(Email:String,Password:String,success: @escaping ( _ Message:String) -> Void  , errorClosure : @escaping (  _ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["email":Email,"password":Password]
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    Alamofire.request("\(baseURL)forgetResetPassword", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
    
   // Alamofire.request("\(baseURL)forgetResetPassword",method:.post, parameters:parameters).validate().responseJSON { response in
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    success("Api Hit Sucessfully")
                    let jsonText = json.rawString()
                    
                    
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                    
                    
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure(error.localizedDescription)
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("something worng")
        }
    }
}
func DOCTOR_DETAILS(DocterId:String,success: @escaping ( _ Message:String) -> Void  , errorClosure : @escaping (  _ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["user_id":DocterId]
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)" ]
    
    Alamofire.request("\(baseURL)api_drFeatchdata", method: .post, parameters: parameters,encoding: URLEncoding.default, headers: headers) .responseJSON { response in
        
        
        
        if((response.result.value) != nil) {
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                if json["status"].int! == 1 {
                    
                    
                    let jsonText = json.rawString()
                    
                    
                    if let data = jsonText?.data(using: String.Encoding.utf8) {
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary
                            var doctordictonary = NSDictionary()
                            doctordictonary = jsonDict!.value(forKey: "data") as! NSDictionary
                            print(doctordictonary)
                            AllDoctordetail = DoctorDetailsModel(dictionary: doctordictonary)
                            
                        } catch {
                            print("Error deserializing JSON: \(error)")
                        }
                    }
                    success("Api Hit Sucessfully")
                    
                } else {
                    errorClosure(json["message"].string!)
                }
            case .failure(let error):
                errorClosure(error.localizedDescription)
                print("Request failed with error: \(error)")
            }
        } else {
            errorClosure("something worng")
        }
    }
}

func       DOCTOR_PROFILE(DocterId:String,AcessKey:String,Userspecification:String,Userfellowships:String,Userexpertise:String,Userservicesoffered:String,Userlanguages:String,Userexperience:String,Userhighlights:String,Userimage:Data?,Fullname:String,Mobile:String,Address:String,success: @escaping (   _ Message:String) -> Void  , errorClosure : @escaping (    _ errorMessage:String) -> Void ){
    
    let parameters:Parameters = ["user_id":DocterId,"acessKey":AcessKey,"user_specification":Userspecification,"user_fellowships":Userfellowships,"user_expertise":Userexpertise,"user_services_offered":Userservicesoffered,"user_languages":Userlanguages,"user_experience":Userexperience,"user_highlights":Userhighlights,"user_image":Userimage,"full_name":Fullname,"mobile":Mobile,"address":Address]
    let user = "dev"
    
    let password = "dev"
    
    let credentialData = "\(user):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    
    let base64Credentials = credentialData.base64EncodedString()
    
    let headers : HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded", "Authorization" : "Basic \(base64Credentials)","Content-type": "multipart/form-data"]
    
    Alamofire.upload(multipartFormData: { (multipartFormData) in
        for (key, value) in parameters {
            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
        }
        
        if let data = Userimage{
            multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
        }
        
    }, usingThreshold: UInt64.init(), to: "\(baseURL)api_save_drProfile", method: .post, headers: headers) { (result) in
        switch result{
        case .success(let upload,_,_):
            upload.responseJSON { response in
                print("Succesfully uploaded")
                success("Sucessfully uploaded")
                if let err = response.error{
                    
                    return
                }
                
            }
        case .failure(let error):
            print("Error in upload: \(error.localizedDescription)")
            
        }
}
}




