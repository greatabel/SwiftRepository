//
//  ViewController.swift
//  AugmentedRealityGallery
//
//  Created by Donny Wals on 29/07/2017.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    let images: [UIImage] = [#imageLiteral(resourceName: "img_1"), #imageLiteral(resourceName: "img_2"), #imageLiteral(resourceName: "img_3"), #imageLiteral(resourceName: "img_4"), #imageLiteral(resourceName: "img_5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // add the selected image to the arkit scene
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionItem", for: indexPath)
        
        if let imageCell = cell as? GalleryCollectionItem {
            imageCell.imageView.image = images[indexPath.row]
        }
        
        return cell
    }
}

