//
//  MealViewController.swift
//  FootTracker
//
//  Created by 万畅 on 15/11/5.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func cancel(sender: UIBarButtonItem) {

        let isPresentingInAddMealMode = presentingViewController is UINavigationController

        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
        
    }

}
