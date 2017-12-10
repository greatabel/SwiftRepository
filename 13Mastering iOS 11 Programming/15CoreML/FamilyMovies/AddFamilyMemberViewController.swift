//
//  AddFamilyMemberViewController.swift
//  FamilyMovies
//
//  Created by Donny Wals on 30/07/16.
//  Copyright © 2016 DonnyWals. All rights reserved.
//

import UIKit

class AddFamilyMemberViewController: UIViewController {
    
    @IBOutlet var familyNameField: UITextField!
    
    var delegate: AddFamilyMemberDelegate?
    
    @IBAction func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped() {
        delegate?.saveFamilyMember(withName: familyNameField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
}
