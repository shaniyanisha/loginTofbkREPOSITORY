//
//  ViewController.swift
//  loginToFBK
//
//  Created by Appinventiv on 27/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit


class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var addImage: UIButton!

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
        
        let likeButton = FBSDKLikeButton()
        likeButton.frame = CGRect(x: 80, y: 90, width: 100, height: 100)
        likeButton.objectID = "https://www.facebook.com/FacebookDevelopers"
        self.view.addSubview(likeButton)
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    
    }
    
    
    
    @IBAction func addImages(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
        picker.delegate = self

        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){

        let newContent = FBSDKSharePhotoContent()
        let photo = FBSDKSharePhoto()
        let image : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photo.image = image
        photo.isUserGenerated = true
        
        newContent.photos = [photo]
        images.image = image
        dismiss(animated: true, completion: nil)
        
    
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
       
        
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

