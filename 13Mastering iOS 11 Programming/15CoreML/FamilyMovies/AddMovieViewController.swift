//
//  AddMovieViewController.swift
//  FamilyMovies
//
//  Created by Donny Wals on 30/07/16.
//  Copyright © 2016 DonnyWals. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    
    @IBOutlet var movieNameField: UITextField!
    
    var delegate: AddMovieDelegate?
    
    @IBAction func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped() {
        delegate?.saveMovie(withName: movieNameField.text ?? "")
        dismiss(animated: true, completion: nil)
    }

}
