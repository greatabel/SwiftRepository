//
//  ViewController.swift
//  9Selfie
//
//  Created by abel on 15/3/1.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    @IBOutlet weak var myImageView: UIImageView!
   
    @IBAction func selfieTapped(sender: AnyObject) {
        
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
            
            if (UIImagePickerController.isCameraDeviceAvailable(.Front)){
                imagePicker.cameraDevice = .Front
            } else {
                imagePicker.cameraDevice = .Rear
            }
            
        }else{
            imagePicker.sourceType = .PhotoLibrary
        }
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func shareTapped(sender: AnyObject) {
     
        var social = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        social.addImage(myImageView.image)
        
        self.presentViewController(social, animated: true , completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        myImageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

