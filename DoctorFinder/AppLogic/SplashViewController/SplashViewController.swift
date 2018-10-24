//
//  SplashViewController.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let imgArr = ["hospital","hospital","hospital","hospital","hospital","hospital","hospital","hospital","hospital"]
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var imgFreelancerDoctor: UIImageView!
    
    @IBOutlet weak var BtnFreelancerDoctor: UIButton!
    
    
    @IBOutlet weak var imgFreelancerHospital: UIImageView!
    
    
    @IBOutlet weak var BtnFreelancerHospital: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //        layout.scrollDirection = .vertical
        //        layout.itemSize = CGSize(width: self.view.bounds.size.width/4, height: self.view.bounds.size.height/4)
        //
        //        CollectionView.collectionViewLayout = layout
        //
        
        let width = (view.frame.width-20)/3
        let height = width * 1.10
        
        let layout = CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 30, right: 30)
        layout.itemSize = CGSize(width: width, height: height)
        
        
        BtnFreelancerDoctor.layer.cornerRadius = 10.0
        BtnFreelancerHospital.layer.cornerRadius = 10.0
        
        imgFreelancerDoctor.layer.borderWidth = 10
        imgFreelancerDoctor.layer.masksToBounds = true
        
       // imgFreelancerDoctor.layer.borderColor = UIColor.white.cgColor
       // imgFreelancerDoctor.layer.cornerRadius = imgFreelancerDoctor.frame.width/2
        imgFreelancerDoctor.layer.borderWidth = 2
        imgFreelancerDoctor.layer.borderColor = UIColor.white.cgColor
        imgFreelancerDoctor.clipsToBounds = true
         imgFreelancerDoctor.layer.cornerRadius = imgFreelancerDoctor.frame.height/2
        
        imgFreelancerHospital.layer.borderWidth = 2
        imgFreelancerHospital.layer.masksToBounds = false
        imgFreelancerHospital.layer.borderColor = UIColor.white.cgColor
        imgFreelancerHospital.layer.cornerRadius = imgFreelancerHospital.frame.height/2
        
        //imgFreelancerHospital.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SplashCollectionViewCell
        cell?.imgView.layer.cornerRadius = (cell?.imgView.frame.height)!/2
        cell?.imgView.layer.borderWidth = 2
        cell?.imgView.layer.borderColor = UIColor.white.cgColor
        cell?.imgView.clipsToBounds = true
      
        //cell?.imgView.layer.cornerRadius = (cell?.imgView.frame.height)!/2
        
        cell?.imgView.image = UIImage(named: self.imgArr[indexPath.row])
        return cell!
    }
   
    
    
    
    @IBAction func btnFreelancerDoc_didSelect(_ sender: UIButton)
    {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func btnFreelancerHospital_didSelect(_ sender: UIButton)
    {
        
    }
    
    
    
    
}
