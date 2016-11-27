//
//  ProfileView.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/9/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit
//import Google
//import GoogleSignIn

//class ProfileView: BaseCell,GIDSignInUIDelegate,GIDSignInDelegate {
//class ProfileView: BaseCell,GIDSignInUIDelegate {
class ProfileView:BaseCell{
    
    
    let imageView : CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "profileimg")
        iv.layer.cornerRadius = 100
        iv.layer.masksToBounds = true
        iv.contentMode = .ScaleAspectFit
        iv.backgroundColor = Colors.ProfileImgBackColor//UIColor.blueColor()
        
        // iv.image?.alignmentRectInsets = .center
        
        return iv
    }()
    
    let profileName : UILabel = {
        let name = UILabel()
        name.text = "Md Asifur Rahman"
        name.backgroundColor = Colors.ProfileNameBackColor//UIColor.whiteColor()
        name.textColor = Colors.ProfileNameTextColor//UIColor.blackColor()
        name.textAlignment = .Center
        name.font = UIFont.boldSystemFontOfSize(20.0)
        //name.font = UIFont.systemFontOfSize(20.0)
        return name
    }()
    
    
    let profileEmail : UILabel = {
        let email = UILabel()
        email.text = "asifurrahman1@gmail.com"
        email.backgroundColor = Colors.ProfileEmailBackColor//UIColor.blueColor()
        email.textColor = Colors.ProfileEmailTextColor//UIColor.whiteColor()
        email.textAlignment = .Center
        email.font = UIFont.boldSystemFontOfSize(16.0)
        // email.font = UIFont.systemFontOfSize(20.0)
        
        return email
    }()
    
    /*   let signInButton : GIDSignInButton = {
     let sib = GIDSignInButton()
     
     return sib
     }()
     */
    var url:String?
    var name:String?
    var email:String?
    /*
     func setProfile(){
     if let url_pic = url{
     self.imageView.loadImageUsingUrlString(url_pic)
     }
     
     }
     */
    /* func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
     if(error != nil){
     print(error)
     return
     }
     let url = String(user.profile.imageURLWithDimension(200))
     let name = String(user.profile.name)
     let email = String(user.profile.email)
     
     
     self.profileName.text = name
     self.profileEmail.text = email
     
     }
     */
    
    override func setupViews() {
        super.setupViews()
        
        /*var error: NSError?
         GGLContext.sharedInstance().configureWithError(&error)
         if error != nil{
         print(error)
         return
         }
         */
        // GIDSignIn.sharedInstance().uiDelegate = self
        // GIDSignIn.sharedInstance().delegate = self
        //  url =  "https://a2ua.com/pocoyo/img-008.php?pic=/pocoyo/pocoyo-008.jpg"
        //   setProfile()
        
        backgroundColor = Colors.ProfileBackgroundColor//UIColor.blueColor()
        addSubview(imageView)
        addConstraintsWithFormat("H:|-100-[v0]-100-|", views: imageView)
        addConstraintsWithFormat("V:|-5-[v0(200)]", views: imageView)
        
        
        addSubview(profileName)
        addConstraintsWithFormat("H:|[v0]|", views: profileName)
        addConstraintsWithFormat("V:|-210-[v0(40)]", views: profileName)
        
        addSubview(profileEmail)
        addConstraintsWithFormat("H:|[v0]|", views: profileEmail)
        addConstraintsWithFormat("V:|-252-[v0(80)]", views: profileEmail)
        
        //   addSubview(signInButton)
        //   addConstraintsWithFormat("H:|[v0]|", views: signInButton)
        //   addConstraintsWithFormat("V:|-333-[v0(50)]", views: signInButton)
        
        
        addSubview(profileEmail)
        addConstraintsWithFormat("H:|[v0]|", views: profileEmail)
        addConstraintsWithFormat("V:|-252-[v0(80)]", views: profileEmail)
        
        // addConstraint(NSLayoutConstraint(item: searchBar, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 40))
        
        
    }
    
}
