//
//  ViewController.swift
//  loginToFBK
//
//  Created by Appinventiv on 27/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        if(FBSDKAccessToken.current() == nil)
        {
            
            print("Not Logged In")
            
            
        }
        else{
            
            print("Logged in")
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","email","user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    
    }
    

}
extension ViewController : FBSDKLoginButtonDelegate{
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        
        if error == nil{
            
            print("login complete ")
        }
        else{
            
            print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        
        print("user logout")
    }
    

    
    
    
    
}

