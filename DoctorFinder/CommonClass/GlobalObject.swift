//
//  GlobalObject.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import Foundation
import UIKit

//#Mark: messages
let kMsgInternetConn = "Please check your internet connection"

let kLogout = "Logout"
let kOk = "Ok"
let kCancel = "Cancel"
let kLogoutMsg = "Are you sure you want to leave?"

var userDetails = LoginDataModel()
var allDoctorListData: [DoctorlistDataModel] = []
var AllDoctordetail = DoctorDetailsModel()
var languageModel: [LanguageModel] = []
var specifyModel: [SpecificationModel] = []
var doctorProfileModel = DoctorProfileModel()

//#Mark: Objects

let kLogin = "isLogin"
let kUserid = "Userid"
let kUserDetails = "userdetails"
let kDoctorListData = "DoctorListDataModel"
let kDoctorDetail = "DoctorDetail"
let kLanguageData = "LanguageModel"
let kspecifyData = "SpecificationModel"
let kDoctorProfile = "doctorProfileModel"




let BackgroundColor = UIColor(red: 22.0/255.0, green: 31.0/255.0, blue: 40.0/255.0, alpha: 1.0)
